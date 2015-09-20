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

@implementation HYCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.delegate=self;
    
    [self.view addSubview:calendar];

}



-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date{

}

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated{

    NSArray *date = [NSArray arrayWithObjects:[NSDate date], nil];
    NSArray *color = [NSArray arrayWithObjects:[UIColor redColor],nil];
    [calendarView markDates:date withColors:color];
}

@end