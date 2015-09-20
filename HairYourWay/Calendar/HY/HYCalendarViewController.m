//
//  HYCalendarViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/20/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "HYCalendarViewController.h"
#import "VRGCalendarView.h"

@interface HYCalendarViewController ()

@end

@implementation HYCalendarViewController{
    NSArray *calendarTableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.delegate=self;
    calendar.center = self.view.center;
    [self.view addSubview:calendar];
    //calling data for tableView

}

#pragma mark - Calendar Methods

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date{

}

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated{

    NSArray *date = [NSArray arrayWithObjects:[NSDate date], nil];
    NSArray *color = [NSArray arrayWithObjects:[UIColor redColor],nil];
    [calendarView markDates:date withColors:color];
}

#pragma mark - TableView


@end
