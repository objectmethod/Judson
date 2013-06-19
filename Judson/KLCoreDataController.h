#import <CoreData/CoreData.h>
#import "KLBaseObject.h"

@interface KLCoreDataController : KLBaseObject

+ (KLCoreDataController *)sharedInstance;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (NSArray*) allObjectsForEntityOfClass:(Class)class;
- (NSArray*) allObjectsForEntityOfClass:(Class)class withPredicate:(NSPredicate *)predicate;

- (id) newObjectForEntityOfClass:(Class)class;
- (id) entityOfClass:(Class)class withPredicate:(NSPredicate*)predicate;

- (void) deleteDatabase;

- (NSURL*) storeURL;

- (void) deleteObject:(NSManagedObject*)object;

@end
