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
        self.wireFrame = [NPPointChargeMainWireFrame class];
        self.presenter = [NPPointChargeMainPresenter class];
        self.interactor = [NPPointChargeMainInteractor class];
        self.view = [NPPointChargeMainViewController class];
    }
    
    return self;
}


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    id<NPCommonWireFrameInterface> sResult = [super wireFrameWithInjectedDependencies];
    
    [(NPPointChargeMainInteractor *)sResult.presenter.interactor setDataManager:[NPPointChargeMainDataManager new]];
    
    return sResult;
}


@end
