//
//  NPMainWireFrame.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainWireFrame.h"
#import "NPWireFrameHelper.h"


@interface NPMainWireFrame()

@property (strong, nonatomic, readonly) UIViewController *viewController;

@end


@implementation NPMainWireFrame


#pragma mark - NPCommonWireFrameInterface


- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonPresenterInterface>)aPresentingWireFrame
{
    //nothing. beacuse main frame is root frame
}


- (void)dismissViewController
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


- (void)showNextWireFrame
{
    [[NPWireFrameHelper nextWireFrameFromWireFrame:self] presentViewControllerFromPresentingViewController:self.viewController presentingWireFrame:self];
}


#pragma mark - NPMainWireFrameInterface


- (void)showMainViewControllerFromWindow:(UIWindow *)aWindw
{
    _viewController = [NPWireFrameHelper viewControllerFromViewFromWireFrame:self];
    
    UINavigationController *sNaviController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
    [aWindw setRootViewController:sNaviController];
}


@end
