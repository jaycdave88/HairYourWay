//
//  SignUpViewController.h
//  HairYourWay
//
//  Created by DEV MODE on 9/16/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtfFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtfLastName;

@property (weak, nonatomic) IBOutlet UITextField *txtfPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtfUserEmail;

- (IBAction)segmentControlValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlGender;
@end
