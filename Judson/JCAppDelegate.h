//
//  JCAppDelegate.h
//  Judson
//
//  Created by Richard Guy on 6/19/13.
//  Copyright (c) 2013 Jackie Cannizzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
