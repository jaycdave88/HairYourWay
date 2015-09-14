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

- (void)viewDidLoad {
    [super viewDidLoad];
    // yoda say
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"public_profile", @"email"];
    loginButton.center = self.view.center;

    [self.view addSubview:loginButton];

}


@end
