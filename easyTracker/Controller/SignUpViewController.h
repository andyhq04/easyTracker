//
//  SignUpViewController.h
//  easyTracker
//
//  Created by Andrea Herbas on 3/15/14.
//  Copyright (c) 2014 Andrea Herbas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import <CoreData/CoreData.h>

@interface SignUpViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end
