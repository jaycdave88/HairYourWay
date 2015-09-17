//
//  ViewController.h
//  HairYourWay
//
//  Created by DEV MODE on 9/14/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController <FBSDKLoginButtonDelegate>

@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

- (IBAction)btnEmailSignUp:(id)sender;

- (IBAction)btnEmailLogin:(id)sender;



@end

