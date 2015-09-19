//
//  ServicesViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/18/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "ServicesViewController.h"

@interface ServicesViewController ()

@end

@implementation ServicesViewController
{
    NSArray *tableDataServices;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    tableDataServices = [NSArray arrayWithObjects:@"Men's haircut",@"Women's haircut",@"Hair color",@"Hair style",@"Blowout ",@"Hot iron styles",@"Special occasion hair styles",@"Eyebrow waxing",@"Eyebrow threading",@"Face waxing",@"Face threading",@"Body waxing",@"Brazilian waxing",@"Facials",@"Microdermabrasion",@"Makeup",@"Full foils",@"Partial foils",nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableDataServices count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.textLabel.text = [tableDataServices objectAtIndex:indexPath.row];
    return cell;
}

@end
