//
//  AppDelegate.h
//  myTRacker
//
//  Created by Andrea Herbas on 12/26/13.
//
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
