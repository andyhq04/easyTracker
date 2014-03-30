//
//  BacklogViewController.h
//  easyTracker
//
//  Created by Andrea Herbas on 3/22/14.
//  Copyright (c) 2014 Andrea Herbas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <CoreData/CoreData.h>

#import "ProjectsViewController.h"

@interface BacklogViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) ProjectsViewController *projectsViewController;
@property (strong, nonatomic) Project *project;

@end
