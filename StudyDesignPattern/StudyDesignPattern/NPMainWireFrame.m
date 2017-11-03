//
//  NPMainWireFrame.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainWireFrame.h"


@implementation NPMainWireFrame


#pragma mark - NPCommonWireFrameInterface


- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonWireFrameInterface>)aPresentingWireFrame
{
    //nothing. beacuse main frame is root frame
}


- (void)dismissViewController:(BOOL)aAnimated;
{
    //nothing. beacuse main frame is root frame
}


- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame
{
    if([self.nextWireFrame isEqual:aPresentedWireFrame])
    {
        self.nextWireFrame = nil;
    }

    if([self.viewController presentedViewController])
    {
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
    }
}


#pragma mark - NPMainWireFrameInterface


- (void)showMainViewControllerFromWindow:(UIWindow *)aWindw
{
    self.viewController = [self viewControllerFromView];
    
    UINavigationController *sNaviController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    [aWindw setRootViewController:sNaviController];
}


@end
