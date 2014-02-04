//
//  TableViewController.h
//  myTRacker
//
//  Created by Andrea Herbas on 12/30/13.
//
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <CoreData/CoreData.h>

#import "ProjectsViewController.h"

@interface TableViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) ProjectsViewController *projectsViewController;

@end
