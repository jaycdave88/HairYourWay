//
//  SignUpViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/16/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"
#import "HYUser.h"
//#import <Parse.h>

@interface SignUpViewController (){
    NSManagedObjectContext *context;
}

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    context = [appDelegate managedObjectContext];

//    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
//    testObject[@"foo"] = @"bar";
//    [testObject saveInBackground];
}

#pragma mark - UITouch Methods

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Action Methods

- (IBAction)segmentControlValueChanged:(id)sender {
    // if statment should assign a value for gender occording to the index value of the given segmented controller
    NSString *gender = NULL;
    self.segmentControlGender = sender;
    if ([self.segmentControlGender selectedSegmentIndex] == 0) {
        NSLog(@"Male");
        gender = @"Male";
    } else if ([self.segmentControlGender selectedSegmentIndex] == 1) {
        NSLog(@"Female");
        gender = @"Female";
    }
    // return the gender varible
    return;
}

- (IBAction)btnUserDataSave:(id)sender {


    HYUser* signUpUserObject = [NSEntityDescription insertNewObjectForEntityForName:@"HYUser" inManagedObjectContext:context];

    NSString *gender = nil;
    NSError *error = nil;

    if ([self.txtfFirstName.text  isEqual: @""] || [self.txtfLastName.text  isEqual: @""] || [self.txtfPhoneNumber.text  isEqual: @""] || [self.txtfUserEmail.text  isEqual: @""]) {
        UIAlertController* errorPrompt = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Required Fields", @"Required Fields")
                                                                             message:NSLocalizedString(@"All fields are required to complete Sign-up. ", nil)
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil)
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

                                                           }];
        [errorPrompt addAction:okAction];
        [self presentViewController:errorPrompt animated:YES completion:NULL];

    }
    else {


        self.labelStatus.text = @"Saved";
        [signUpUserObject setValue:self.txtfFirstName.text forKey:@"firstName"];
        [signUpUserObject setValue:self.txtfLastName.text forKey:@"lastName"];
        [signUpUserObject setValue:self.txtfPhoneNumber.text forKey:@"phone"];
        [signUpUserObject setValue:self.txtfUserEmail.text forKey:@"email"];

        gender =  self.segmentControlGender.selectedSegmentIndex == 0 ? @"Male" : @"Female";

        [signUpUserObject setValue:gender forKey:@"gender"];

        if(![context save:&error]) {
            self.labelStatus.text = @"Error";
            NSLog(@"%@, %@", error, error.localizedDescription);
        }
        else {
            UIAlertController* errorPrompt = [UIAlertController alertControllerWithTitle:@"HairYourWay"
                                                                                 message:NSLocalizedString(@"STR_NEW_USER_SIGN_UP_SUCCEEDED", @"Success")
                                                                          preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil)
                                                               style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                                   [self.navigationController popViewControllerAnimated:YES];
                                                               }];
            [errorPrompt addAction:okAction];
            [self presentViewController:errorPrompt animated:YES completion:NULL];

        }
    }
}
@end
