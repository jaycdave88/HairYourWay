//
//  HYCalendarViewController.m
//  HairYourWay
//
//  Created by Rahul Sharma on 9/22/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "HYCalendarViewController.h"


@implementation HYCalendarViewController

- (void)viewDidLoad {
        
    [super viewDidLoad];
    
    _calendarManager = [JTCalendarManager new];
    _calendarManager.delegate = self;
    
    [_calendarManager setMenuView:_calendarMenuView];
    [_calendarManager setContentView:_calendarContentView];
    [_calendarManager setDate:[NSDate date]];
}


@end