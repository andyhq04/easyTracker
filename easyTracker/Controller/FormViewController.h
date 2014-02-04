//
//  FormViewController.h
//  easyTracker
//
//  Created by Andrea Herbas on 2/2/14.
//  Copyright (c) 2014 Andrea Herbas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Story.h"

@interface FormViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *points;
@property (weak, nonatomic) IBOutlet UILabel *description;

@property (strong, nonatomic) Story *story;
@end
