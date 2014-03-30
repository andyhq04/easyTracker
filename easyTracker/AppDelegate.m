//
//  AppDelegate.m
//  easyTracker
//
//  Created by Andrea Herbas on 1/27/14.
//  Copyright (c) 2014 Andrea Herbas. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "LUKeychainServices.h"
#import "APIConnector.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    RKLogConfigureByName("RestKit/Network", RKLogLevelTrace);
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    
   // [[LUKeychainServices keychainServices] deleteAllItemsWithError:NULL];

    if([[LUKeychainServices keychainServices] dataForKey:@"password" error:NULL]) {
        APIConnector *connector = [APIConnector sharedInstance];
        //NSData *pwd = [[LUKeychainServices keychainServices] dataForKey:@"password" error:NULL];
        NSString *pwdStr = [[LUKeychainAccess standardKeychainAccess] stringForKey:@"password"];//[[NSString alloc] initWithData:pwd encoding:NSUTF8StringEncoding];
        NSLog(@"password %@", pwdStr);
        //NSData *data = [[LUKeychainServices keychainServices] dataForKey:@"loginToken" error:NULL];
        //NSLog(@"data %@", data);
        NSString* token = [[LUKeychainAccess standardKeychainAccess] stringForKey:@"loginToken"];
        NSLog(@"token %@", token);
        
        //data = [[LUKeychainServices keychainServices] dataForKey:@"userId" error:NULL];
        NSString* userId = [[LUKeychainAccess standardKeychainAccess] stringForKey:@"userId"];//[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"userID %@", userId);
        
        [[[RKObjectManager sharedManager] HTTPClient] setDefaultHeader:@"X-Login-Token" value:token];
        [[[RKObjectManager sharedManager] HTTPClient] setDefaultHeader:@"X-User-Id" value:userId];

        UITabBarController *tableViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        window.rootViewController = tableViewController;
    } else {
        window.rootViewController = [storyboard instantiateInitialViewController];
    }

    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
