//
//  ProjectsViewController.h
//  myTRacker
//
//  Created by Andrea Herbas on 1/2/14.
//
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <CoreData/CoreData.h>
#import "Project.h"

@interface ProjectsViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (retain) NSIndexPath* lastIndexPath;
@property (strong, nonatomic) Project* project;
@property (strong, nonatomic) IBOutlet UITableView *projectsTable;

@end
