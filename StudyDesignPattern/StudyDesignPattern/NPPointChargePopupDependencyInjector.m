//
//  NPPointChargePopupDependencyInjector.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargePopupDependencyInjector.h"

#import "NPPointChargePopupWireFrame.h"
#import "NPPointChargePopupPresenter.h"
#import "NPPointChargePopupInteractor.h"
#import "NPPointChargePopupViewController.h"


@implementation NPPointChargePopupDependencyInjector


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.wireFrame = [NPPointChargePopupWireFrame class];
        self.presenter = [NPPointChargePopupPresenter class];
        self.interactor = [NPPointChargePopupInteractor class];
        self.view = [NPPointChargePopupViewController class];
    }
    
    return self;
}


@end
