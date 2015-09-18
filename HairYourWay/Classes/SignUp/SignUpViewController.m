//
//  SignUpViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/16/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "SignUpViewController.h"
#import "AppDelegate.h"

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

    NSEntityDescription * entityDescription = [NSEntityDescription entityForName:@"HYUser" inManagedObjectContext:context];
    NSManagedObject *newUser = [[NSManagedObject alloc]initWithEntity:entityDescription insertIntoManagedObjectContext:context];
    NSString *gender = NULL;
    NSError *error = nil;

    [newUser setValue:self.txtfFirstName.text forKey:@"firstName"];
    [newUser setValue:self.txtfLastName.text forKey:@"lastName"];
    [newUser setValue:self.txtfPhoneNumber.text forKey:@"phone"];
    [newUser setValue:self.txtfUserEmail.text forKey:@"email"];

    if (self.segmentControlGender.selectedSegmentIndex == 0) {
        gender = @"Male";
    }else if(self.segmentControlGender.selectedSegmentIndex == 1){
        gender = @"Female";
    }else{
        NSLog(@"ERROR in gender saving");
    }
    [newUser setValue:gender forKey:@"gender"];

    if ([self.txtfFirstName.text  isEqual: @""] || [self.txtfLastName.text  isEqual: @""] || [self.txtfPhoneNumber.text  isEqual: @""] || [self.txtfUserEmail.text  isEqual: @""]) {
        UIAlertController* errorPrompt = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Required Fields", @"Required Fields")
                                                                             message:NSLocalizedString(@"All fields are required to complete Sign-up. ", nil)
                                                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil)
                                                           style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

                                                           }];
        [errorPrompt addAction:okAction];
        [self presentViewController:errorPrompt animated:YES completion:NULL];

    }else{
        if(![context save:&error]) {
            self.labelStatus.text = @"Error";
        }else{
            [context save:&error];
            self.labelStatus.text = @"Saved";
        }
    }
}
@end
