//
//  SecondViewController.h
//  myTRacker
//
//  Created by Andrea Herbas on 12/26/13.
//
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <CoreData/CoreData.h>

#import "ProjectsViewController.h"

@interface SecondViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) ProjectsViewController *projectsViewController;

@end
