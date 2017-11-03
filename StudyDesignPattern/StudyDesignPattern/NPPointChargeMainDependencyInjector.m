//
//  NPPointChargeMainDependencyInjector.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainDependencyInjector.h"

#import "NPPointChargeMainWireFrame.h"
#import "NPPointChargeMainPresenter.h"
#import "NPPointChargeMainViewController.h"
#import "NPPointChargeMainInteractor.h"
#import "NPPointChargeMainDataManager.h"


@implementation NPPointChargeMainDependencyInjector


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.wireFrame = [NPPointChargeMainWireFrame new];
        self.presenter = [NPPointChargeMainPresenter new];
        self.interactor = [NPPointChargeMainInteractor new];
        self.view = [NPPointChargeMainViewController new];
    }
    
    return self;
}


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    [super wireFrameWithInjectedDependencies];
    
    [self.interactor setDataManager:[NPPointChargeMainDataManager new]];
    
    return self.wireFrame;
}


@end
