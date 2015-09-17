//
//  HYUser.h
//  HairYourWay
//
//  Created by DEV MODE on 9/16/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HYUser : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * phone;


@end
