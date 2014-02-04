//
//  SecondViewController.m
//  myTRacker
//
//  Created by Andrea Herbas on 12/26/13.
//
//

#import "SecondViewController.h"

#import "ProjectsViewController.h"

#import "APIConnector.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Burndown", @"Burndown");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    //[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   /* UIBarButtonItem *buttonItem;
    
    buttonItem = [[UIBarButtonItem alloc]initWithTitle: @"Projects" style: UIBarButtonItemStyleBordered target: self action: @selector(showProjects)];
    self.navigationItem.leftBarButtonItem = buttonItem;*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)showProjects
{
    self.projectsViewController.managedObjectContext = self.managedObjectContext;
    
    [self presentViewController:self.projectsViewController animated:YES completion:nil];
}*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"projects"])
    {
        //NSIndexPath *index = self.projectsViewController.lastIndexPath;
        self.projectsViewController = [segue destinationViewController];
        self.projectsViewController.managedObjectContext = APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext;
       // self.projectsViewController.lastIndexPath = index;
    }
}

@end
