//
//  LoginViewController.h
//  myTRacker
//
//  Created by Andrea Herbas on 12/26/13.
//
//

#import <UIKit/UIKit.h>

@protocol LoginViewControllerDelegate;

@interface LoginViewController : UIViewController {
    id<LoginViewControllerDelegate> delegate;
    
    
}
- (IBAction)onLogin:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end