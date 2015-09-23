//
//  HYCalendarViewController.m
//  HairYourWay
//
//  Created by Rahul Sharma on 9/22/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "HYCalendarViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "SignUpViewController.h"
#import "HYAlertViewController.h"

@interface HYCalendarViewController(){
    NSData * dateSelected;
    NSArray * arrCalendarData;
}

@end

@implementation HYCalendarViewController


- (void)viewDidLoad {
        
    [super viewDidLoad];
    
    _calendarManager = [JTCalendarManager new];
    _calendarManager.delegate = self;
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:[NSDate date]];

    [self calendarTableViewData];
}

#pragma mark - Calendar Methods

- (void)calendar:(JTCalendarManager *)calendar prepareDayView:(JTCalendarDayView *)dayView
{
    dayView.hidden = NO;

    if([dayView isFromAnotherMonth]){
        dayView.hidden = YES;
    }
    // Today
    else if([_calendarManager.dateHelper date:[NSDate date] isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor redColor];
        dayView.dotView.backgroundColor = [UIColor blackColor];
        dayView.textLabel.textColor = [UIColor whiteColor];
    }
    // Selected date
    else if(dateSelected && [_calendarManager.dateHelper date:dateSelected isTheSameDayThan:dayView.date]){
        dayView.circleView.hidden = NO;
        dayView.circleView.backgroundColor = [UIColor colorWithRed:211.0/225.0 green:211.0/225.0 blue:211.0/225.0 alpha:1];
        dayView.textLabel.textColor = [UIColor blackColor];
    }
    // Another day of the current month
    else{
        dayView.circleView.hidden = YES;
        dayView.dotView.backgroundColor = [UIColor redColor];
        dayView.textLabel.textColor = [UIColor blackColor];
    }
}

- (void)calendar:(JTCalendarManager *)calendar didTouchDayView:(JTCalendarDayView *)dayView
{
    NSLog(@"%@",dayView.date);
    // Use to indicate the selected date
    dateSelected = dayView.date;

    // Animation for the circleView
    dayView.circleView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.1, 0.1);
    [UIView transitionWithView:dayView
                      duration:.3
                       options:0
                    animations:^{
                        dayView.circleView.transform = CGAffineTransformIdentity;
                        [_calendarManager reload];
                    } completion:nil];
}

# pragma mark - Appointment TableView Methods

-(void)calendarTableViewData{
    arrCalendarData = [[NSArray alloc]initWithObjects:@"10:00 AM",@"11:00 AM",@"12:00 PM",@"1:00 PM",@"2:00 PM",@"3:00 PM",@"4:00 PM",@"5:00 PM", @"6:00 PM", nil];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrCalendarData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"Services";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [arrCalendarData objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"You have selected: %@",cell.text);
    [self returningUserOrNewUser];

}

-(void)returningUserOrNewUser{
    NSFetchRequest * fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"HYUser"];
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"firstName" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];

    AppDelegate* delegateObject = (AppDelegate*)[UIApplication sharedApplication].delegate;
    NSManagedObjectContext* context = [delegateObject managedObjectContext];
    NSError* fetchError = nil;
    NSArray* matchingResults = [context executeFetchRequest:fetchRequest error:&fetchError];

    SignUpViewController * signUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"kSceneSignUpViewController"];

    HYAlertViewController * alertVC = [self.storyboard instantiateViewControllerWithIdentifier:@"kHYAlertViewController"];

// check if the user is signed up
    if ([matchingResults count] == 0) {
        // send to kSceneSignUpViewController
       [self.navigationController pushViewController:signUpVC animated:YES];
    }else{
        // send to kHYAlertViewController
        [self.navigationController pushViewController:alertVC animated:YES];
    }
    
}





@end