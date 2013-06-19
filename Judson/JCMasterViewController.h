//
//  JCMasterViewController.h
//  Judson
//
//  Created by Richard Guy on 6/19/13.
//  Copyright (c) 2013 Jackie Cannizzo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface JCMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
