//
//  SignUpViewController.h
//  HairYourWay
//
//  Created by DEV MODE on 9/16/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtfFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtfLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtfPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtfUserEmail;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlGender;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;


- (IBAction)segmentControlValueChanged:(id)sender;

- (IBAction)btnUserDataSave:(id)sender;

@end
