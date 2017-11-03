//
//  NPPointChargeMainViewController.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainViewController.h"


@interface NPPointChargeMainViewController ()

@end


@implementation NPPointChargeMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
}


- (CGSize)viewSizeForContainerSize:(CGSize)aContainerSize
{
    return [DeviceInfo deviceSize];
}


@end
