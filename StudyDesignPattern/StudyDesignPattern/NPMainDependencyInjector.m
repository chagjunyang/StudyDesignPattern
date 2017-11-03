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
        self.wireFrame = [NPMainWireFrame new];
        self.presenter = [NPMainPresenter new];
        self.view = [NPMainViewController new];
        self.interactor = [NPMainInteractor new];
        self.nextDependencyInjector = [NPPointChargeMainDependencyInjector new];
    }
    
    return self;
}


#pragma mark - NPCommonDependencyInjectorInterface


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    return [super wireFrameWithInjectedDependencies];
}


@end
