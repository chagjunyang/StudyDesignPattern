//
//  NPBaseWireFrame.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPBaseWireFrame.h"


@implementation NPBaseWireFrame


#pragma mark - NPCommonWireFrameInterface


- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonWireFrameInterface>)aPresentingWireFrame
{
    _prevContext = aController;
    _prevWireFrame = aPresentingWireFrame;
    _viewController = [self viewControllerFromView];
}


- (void)dismissViewController:(BOOL)aAnimated;
{
    //nothing
}


- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame
{
    if([self.nextWireFrame isEqual:aPresentedWireFrame])
    {
        self.nextWireFrame = nil;
    }
}


- (void)showNextWireFrame
{
    if(!self.nextWireFrame)
    {
        self.nextWireFrame = [self nextWireFrameFromDependencyInjector];
    }
    
    [self.nextWireFrame presentViewControllerFromPresentingViewController:self.viewController presentingWireFrame:self];
}


#pragma mark - helper


- (id<NPCommonWireFrameInterface>)nextWireFrameFromDependencyInjector
{
    id<NPCommonWireFrameInterface> sResult = nil;
    
    if(!self.nextWireFrame)
    {
        sResult = [self.nextDependencyInjector wireFrameWithInjectedDependencies];
    }
    
    return sResult;
}


- (UIViewController *)viewControllerFromView
{
    UIViewController *sViewControlelr = nil;
    
    if([self.view isKindOfClass:[UIViewController class]])
    {
        sViewControlelr = (UIViewController *)self.view;
    }
    
    return sViewControlelr;
}


@end
