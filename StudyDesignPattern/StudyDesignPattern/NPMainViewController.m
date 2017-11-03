//
//  NPMainViewController.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainViewController.h"


@interface NPMainViewController ()

@property (strong, nonatomic, readonly) UIButton *pointChargeButton;

@end


@implementation NPMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setupChargeButton];
    
    [self.presenter updateView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    
    
}


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.pointChargeButton TUMMoveToVerticalCenter];
    [self.pointChargeButton TUMMoveToHorizontalCenter];
}


#pragma mark - NPMainViewInterface


- (void)setPointChargeButtonTitle:(NSString *)aTitle
{
    [self.pointChargeButton setTitle:aTitle forState:UIControlStateNormal];
}


#pragma mark - NPCommonViewInterface


- (CGSize)viewSizeForContainerSize:(CGSize)aContainerSize
{
    return aContainerSize;
}


#pragma mark - Setup


- (void)setupChargeButton
{
    _pointChargeButton = [UIButton new];
    
    [self.pointChargeButton TUMSetSize:CGSizeMake(200, 50)];
    [self.pointChargeButton setBackgroundColor:[UIColor grayColor]];
    [self.pointChargeButton addTarget:self action:@selector(tappedChargeButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.pointChargeButton];
}


#pragma mark - Action


- (void)tappedChargeButton:(id)aSender
{
    if([self.presenter respondsToSelector:@selector(tappedChargeButton:)])
    {
        [self.presenter tappedChargeButton:aSender];
    }
}


@end
