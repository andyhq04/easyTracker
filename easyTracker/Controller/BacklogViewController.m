//
//  BacklogViewController.m
//  easyTracker
//
//  Created by Andrea Herbas on 3/22/14.
//  Copyright (c) 2014 Andrea Herbas. All rights reserved.
//

#import "BacklogViewController.h"
#import "FormViewController.h"
#import "ProjectsViewController.h"
#import "APIConnector.h"
#import "CoreData+MagicalRecord.h"
#import "LUKeychainServices.h"

#import "Story.h"

@interface BacklogViewController ()

@end

@implementation BacklogViewController

@synthesize managedObjectContext;
@synthesize fetchedResultsController = _fetchedResultsController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Backlog", @"Backlog");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        self.title = NSLocalizedString(@"Backlog", @"Backlog");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        self.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
        [self setSelectedProject:[[LUKeychainAccess standardKeychainAccess] stringForKey:@"projectId"]];
        NSLog(@"projectID %@", [[LUKeychainAccess standardKeychainAccess] stringForKey:@"projectId"]);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Retrieve all tags
    NSError *error;
    if (![self.fetchedResultsController performFetch:&error]) {
	    NSLog(@"Error in tag retrieval %@, %@", error, [error userInfo]);
	    abort();
	}
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(loadStories) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    [self.tableView reloadData];
    [self loadStories];
    [self.refreshControl beginRefreshing];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self setSelectedProject:[[LUKeychainAccess standardKeychainAccess] stringForKey:@"projectId"]];
}

- (void)loadStories
{
    APIConnector *connector = [APIConnector sharedInstance];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"project.id = %@ AND iteration = %@", self.project.id, self.project.currentIteration];
    [self.fetchedResultsController.fetchRequest setPredicate:predicate];
    
    [connector loadStoriesByProject:self.project success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        [self reloadTable:error];
        [self.refreshControl endRefreshing];
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [self reloadTable:error];
        [self.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    NSLog(@"Rows %d", [sectionInfo numberOfObjects]);
    NSLog(@"Rows %@", sectionInfo);
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Story" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    [fetchRequest setFetchBatchSize:300];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

#pragma mark - Table view delegate

/*- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 FormViewController *loginViewController = [[FormViewController alloc]initWithNibName:@"FormViewController" bundle:nil];
 //loginViewController. = APIConnector.sharedInstance.managedObjectStore.mainQueueManagedObjectContext;
 [self.navigationController pushViewController:loginViewController animated:YES];
 }*/

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    Story *story = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = story.title;
    cell.detailTextLabel.text = story.title;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"projects"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        
        ProjectsViewController *projectViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProjectsViewController"];
        UINavigationController *navController = [segue destinationViewController];
        
        projectViewController.managedObjectContext = [NSManagedObjectContext MR_defaultContext];
        self.projectsViewController = projectViewController;
        [self.projectsViewController addObserver:self forKeyPath:@"project" options:NSKeyValueObservingOptionNew context:NULL];
        
        [navController pushViewController:projectViewController animated:YES];
        
    } else {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Story *story = [self.fetchedResultsController objectAtIndexPath:indexPath];
        FormViewController *form = [segue destinationViewController];
        form.story = story;
    }
}

-(void)reloadTable:(NSError *) error
{
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Error in tag retrieval %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self.tableView reloadData];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"project"])
    {
        self.project = self.projectsViewController.project;
        [self loadStories];
    }
}

-(void)setSelectedProject:(NSString *)projectId
{
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Project" inManagedObjectContext:self.managedObjectContext];
    [fetch setEntity:entityDescription];
    [fetch setPredicate:[NSPredicate predicateWithFormat:@"id = %@", projectId]];
    NSError *error = nil;
    NSArray *projects = [self.managedObjectContext executeFetchRequest:fetch error:&error];
    
    if ([projects count] == 1) {
        self.project = [projects objectAtIndex:0];
    } else {
        self.project = nil;
    }
    [self loadStories];
}

@end
