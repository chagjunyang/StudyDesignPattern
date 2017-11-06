//
//  NPPointChargePopupViewController.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargePopupViewController.h"


@interface NPPointChargePopupViewController()

@property (strong, nonatomic, readwrite) UILabel *guideLabel;
@property (strong, nonatomic, readwrite) UIButton *confirmButton;

@end


@implementation NPPointChargePopupViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self setupGuideText];
    [self setupConfirmButton];
    
    [self.presenter updateViewWithCompletion:^{
        [self setSizeAndLayoutSubviews];
    }];
}


- (CGSize)viewSizeForContainerSize:(CGSize)aContainerSize
{
    return [DeviceInfo deviceSize];
}


#pragma mark - NPPointChargePopupViewInterface


- (void)setGuideText:(NSString *)aString
{
    [self.guideLabel setText:aString];
}


- (void)setConfirmButtonTitle:(NSString *)aTitle
{
    [self.confirmButton setTitle:aTitle forState:UIControlStateNormal];
}


#pragma mark - setup


- (void)setSizeAndLayoutSubviews
{
    [self.guideLabel sizeToFit];
    [self.confirmButton TUMSetSize:CGSizeMake([DeviceInfo deviceSize].width, 50)];
    
    [self.guideLabel TUMMoveToVerticalCenter];
    [self.guideLabel TUMMoveToHorizontalCenter];
    
    [self.confirmButton TUMSetXPosition:0];
    [self.confirmButton TUMMoveToBottomWithMargin:0];
}


- (void)setupGuideText
{
    _guideLabel = [UILabel new];
    
    [self.guideLabel setFont:[UIFont systemFontOfSize:15]];
    [self.guideLabel setTextColor:[UIColor blackColor]];
    
    [self.view addSubview:self.guideLabel];
}


- (void)setupConfirmButton
{
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.confirmButton addTarget:self action:@selector(tappedConfirmButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.confirmButton setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:self.confirmButton];
}


#pragma mark - action


- (void)tappedConfirmButton:(id)aSender
{
    if([self.presenter respondsToSelector:@selector(tappedConfirmButton:)])
    {
        [(id<NPPointChargePopupPresenterInterface>)self.presenter tappedConfirmButton:aSender];
    }
}


@end
