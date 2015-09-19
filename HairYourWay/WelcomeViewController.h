//
//  ViewController.h
//  HairYourWay
//
//  Created by DEV MODE on 9/14/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface WelcomeViewController : UIViewController <FBSDKLoginButtonDelegate>

@property (nonatomic , weak) IBOutlet UILabel* lblWelcomeMessage;

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

- (IBAction)btnEmailSignUp:(id)sender;

- (IBAction)btnEmailLogin:(id)sender;

@end