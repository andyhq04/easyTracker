//
//  LoginViewController.m
//  myTRacker
//
//  Created by Andrea Herbas on 12/26/13.
//
//

#import "LoginViewController.h"
#import "SecondViewController.h"
#import "APIConnector.h"
#import "LUKeychainServices.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"project_controller"])
    {
        [self login];
    }
}

- (IBAction)onLogin:(id)sender {
    [self login];
}

- (void)login
{
    APIConnector *connector = [APIConnector sharedInstance];
    
    [connector login:self.usernameText.text password:self.passwordText.text success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
 
        [[[RKObjectManager sharedManager] HTTPClient] setDefaultHeader:@"X-Login-Token" value:[mappingResult.firstObject valueForKeyPath:@"loginToken"]];
        [[[RKObjectManager sharedManager] HTTPClient] setDefaultHeader:@"X-User-Id" value:[mappingResult.firstObject valueForKeyPath:@"userId"]];
        //NSData * data = [[mappingResult.firstObject valueForKeyPath:@"loginToken"] dataUsingEncoding:NSUTF8StringEncoding];
        [[LUKeychainAccess standardKeychainAccess] setString:[mappingResult.firstObject valueForKeyPath:@"loginToken"] forKey:@"loginToken"];
       //data = [[mappingResult.firstObject valueForKeyPath:@"userId"] dataUsingEncoding:NSUTF8StringEncoding];
        [[LUKeychainAccess standardKeychainAccess] setString:[mappingResult.firstObject valueForKeyPath:@"userId"] forKey:@"userId"];
        //data = [self.passwordText.text dataUsingEncoding:NSUTF8StringEncoding];
        //NSLog(@"data login %@", data);
        [[LUKeychainAccess standardKeychainAccess] setString:self.passwordText.text forKey:@"password"];
        
        [self performSegueWithIdentifier:@"login" sender:self];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An Error Has Occurred" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }];
}
@end
