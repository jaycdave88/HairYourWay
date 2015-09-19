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
    static NSString *simpleTableIdentifier = @"Services";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    tableView.allowsMultipleSelection =YES;
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.textLabel.text = [tableDataServices objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

@end
