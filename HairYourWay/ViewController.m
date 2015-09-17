//
//  ViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/14/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize loginButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    // yoda say
    loginButton.readPermissions = @[@"public_profile", @"email"];
    [loginButton setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
        [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {

    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"/me"
                                  parameters:@{@"fields" : @"email,first_name,last_name,gender"}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          id result,
                                          NSError *error) {
        if (!error) {
            NSString *email = [result objectForKey:@"email"];
            NSString *first_name = [result objectForKey:@"first_name"];
            NSString *last_name = [result objectForKey:@"last_name"];
            NSString *gender = [result objectForKey:@"gender"];

            NSLog(@"User email is: %@",email);
            NSLog(@"User first name is: %@",first_name);
            NSLog(@"User last name is: %@",last_name);
            NSLog(@"User gender is: %@",gender);

            // add logic to show to next view with services
        }

    }];

}


- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {

}


#pragma - Login Button Actions

- (IBAction)btnEmailSignUp:(id)sender {

}

- (IBAction)btnEmailLogin:(id)sender {

}
@end
