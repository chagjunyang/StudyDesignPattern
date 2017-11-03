//
//  NPBaseDependencyInjector.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPBaseDependencyInjector.h"


@implementation NPBaseDependencyInjector


#pragma mark - NPCommonDependencyInjectorInterface


- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies
{
    id<NPCommonWireFrameInterface> sWireFrame = [self.wireFrame new];
    id<NPCommonViewInterface> sView = [self.view new];
    id<NPCommonPresenterInterface> sPresenter = [self.presenter new];
    id<NPCommonDependencyInjectorInterface> sNextDependencyInjector = [self.nextDependencyInjector new];
    id sInteractor = nil;
    
    if(self.interactor)
    {
       sInteractor = [self.interactor new];
    }
    
    
    sWireFrame.presenter = sPresenter;
    sWireFrame.view = sView;
    sWireFrame.nextDependencyInjector = sNextDependencyInjector;
    
    sPresenter.interactor = sInteractor;
    sPresenter.view = sView;
    sPresenter.wireFrame = sWireFrame;
    
    sView.presenter = sPresenter;
    
    return sWireFrame;
}


@end
