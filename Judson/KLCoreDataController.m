#import "KLCoreDataController.h"
#import "UIApplication+DocumentsDirectory.h"

@implementation KLCoreDataController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (KLCoreDataController *)sharedInstance {
    static KLCoreDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[KLCoreDataController alloc] init];
    });
    return sharedInstance;
}

- (void)deleteObject:(NSManagedObject *)object {
    [self.managedObjectContext deleteObject:object];
    [self saveContext];
}

- (void)saveContext {
	NSError* error;
	if(![self.managedObjectContext save:&error]) {
		[self postNotificationForError:error];
		
		NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
		NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
		if(detailedErrors != nil && [detailedErrors count] > 0) {
			for(NSError* detailedError in detailedErrors) {
				DDLogError(@"  DetailedError: %@", [detailedError userInfo]);
			}
		}
		else {
			DDLogError(@"  %@", [error userInfo]);
		}
	}
}

- (void)deleteDatabase {
    _managedObjectContext = nil;
    _managedObjectModel = nil;
    _persistentStoreCoordinator = nil;
    [[NSFileManager defaultManager] removeItemAtURL:self.storeURL error:nil];
}

- (NSURL *)storeURL {
    return [[UIApplication documentsDirectoryURL] URLByAppendingPathComponent:@"Kortlist.sqlite"];
}

#pragma mark get entities

- (id)entityOfClass:(Class)class withPredicate:(NSPredicate *)predicate {
    NSArray *entities = [self allObjectsForEntityOfClass:class withPredicate:predicate];
    return entities.count > 0 ? [entities objectAtIndex:0] : nil;
}

- (id) newObjectForEntityOfClass:(Class)class {
    return [NSEntityDescription insertNewObjectForEntityForName:[class description] inManagedObjectContext:self.managedObjectContext];
}

- (NSArray*) allObjectsForEntityOfClass:(Class)class {
    return [self allObjectsForEntityOfClass:class withPredicate:nil];
}

- (NSArray*) allObjectsForEntityOfClass:(Class)class withPredicate:(NSPredicate *)predicate {
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:[class description] inManagedObjectContext:self.managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    [request setPredicate:predicate];
    [request setSortDescriptors:nil];
    
    NSError *error;
    
    return [self.managedObjectContext executeFetchRequest:request error:&error];
}

#pragma mark - Core Data stack

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Kortlist" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:self.storeURL options:options error:&error]) {
        [self postNotificationForError:error];
    }
    
    return _persistentStoreCoordinator;
}

@end
