//
//  NPWireFrameHelper.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPWireFrameHelper.h"


@implementation NPWireFrameHelper


+ (id<NPCommonWireFrameInterface>)nextWireFrameFromWireFrame:(id<NPCommonWireFrameInterface>)aFromWireFrame
{
    id<NPCommonWireFrameInterface> sResult = nil;
    
    if(!aFromWireFrame.nextWireFrame)
    {
        sResult = [aFromWireFrame.nextDependencyInjector wireFrameWithInjectedDependencies];
    }
    
    return sResult;
}


+ (UIViewController *)viewControllerFromViewFromWireFrame:(id<NPCommonWireFrameInterface>)aFromWireFrame
{
    UIViewController *sViewControlelr = nil;
    
    if([aFromWireFrame.view isKindOfClass:[UIViewController class]])
    {
        sViewControlelr = (UIViewController *)aFromWireFrame.view;
    }
    
    return sViewControlelr;
}


@end
