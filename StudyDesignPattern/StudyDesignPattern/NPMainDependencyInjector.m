//
//  NPMainDependencyInjector.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainDependencyInjector.h"

#pragma mark - dependencies
#import "NPMainViewController.h"
#import "NPMainPresenter.h"
#import "NPMainInteractor.h"
#import "NPMainWireFrame.h"
#import "NPPointChargeMainDependencyInjector.h"


@implementation NPMainDependencyInjector


- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.wireFrame = [NPMainWireFrame class];
        self.presenter = [NPMainPresenter class];
        self.view = [NPMainViewController class];
        self.interactor = [NPMainInteractor class];
        self.nextDependencyInjector = [NPPointChargeMainDependencyInjector class];
    }
    
    return self;
}


#pragma mark - NPCommonDependencyInjectorInterface


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    return [super wireFrameWithInjectedDependencies];
}


@end
