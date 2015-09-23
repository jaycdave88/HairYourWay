//
//  ServicesViewController.m
//  HairYourWay
//
//  Created by DEV MODE on 9/18/15.
//  Copyright (c) 2015 DEV MODE. All rights reserved.
//

#import "ServicesViewController.h"

static NSString *reuseIdentifier = @"ServicesCell";

@interface ServicesViewController () {
 NSArray*      arrAvaialbleServicesList;
}

@end

@implementation ServicesViewController

@synthesize tblvServiceList;

#pragma mark - View Life Cycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrAvaialbleServicesList = [NSArray arrayWithObjects:@"Men's haircut",@"Women's haircut",@"Hair color",@"Hair style",@"Blowout ",@"Hot iron styles",@"Special occasion hair styles",@"Eyebrow waxing",@"Eyebrow threading",@"Face waxing",@"Face threading",@"Body waxing",@"Brazilian waxing",@"Facials",@"Microdermabrasion",@"Makeup",@"Full foils",@"Partial foils",nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrAvaialbleServicesList count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];

    cell.textLabel.text = [arrAvaialbleServicesList objectAtIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
}

@end
