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
    self.wireFrame.presenter = self.presenter;
    self.wireFrame.view = self.view;
    self.wireFrame.nextDependencyInjector = self.nextDependencyInjector;
    
    self.presenter.interactor = self.interactor;
    self.presenter.view = self.view;
    self.presenter.wireFrame = self.wireFrame;
    
    self.view.presenter = self.presenter;
    
    return self.wireFrame;
}


@end
