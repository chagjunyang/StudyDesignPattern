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
#import "NPMainDataManager.h"
#import "NPMainWireFrame.h"


@implementation NPMainDependencyInjector


#pragma mark - NPCommonDependencyInjectorInterface


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    return [self mainWireFrameWithInjectedDependencies];
}


- (id<NPMainWireFrameInterface>)mainWireFrameWithInjectedDependencies
{
    NPMainWireFrame *sWireFrame = [NPMainWireFrame new];
    NPMainPresenter *sPresenter = [NPMainPresenter new];
    NPMainViewController *sView = [NPMainViewController new];
    NPMainInteractor *sInteractor = [NPMainInteractor new];
    
    sWireFrame.presenter = sPresenter;
    sWireFrame.view = sView;
    sWireFrame.nextWireFrame = nil;
    
    sPresenter.interactor = sInteractor;
    sPresenter.view = sView;
    sPresenter.wireFrame = sWireFrame;
    
    sView.presenter = sPresenter;
    
    return sWireFrame;
}


@end
