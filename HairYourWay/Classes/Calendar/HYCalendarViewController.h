//
//  HYCalendarViewController.h
//  HairYourWay
//
//  Created by Rahul Sharma on 9/22/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <UIKit/UIKit.h>

// https://github.com/jonathantribouharet/JTCalendar
#import <JTCalendar/JTCalendar.h>

@interface HYCalendarViewController : UIViewController <JTCalendarDelegate>

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTHorizontalCalendarView *calendarContentView;

@property (strong, nonatomic) JTCalendarManager *calendarManager;

@end