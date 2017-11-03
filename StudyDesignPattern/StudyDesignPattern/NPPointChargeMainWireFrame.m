//
//  NPPointChargeMainWireFrame.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainWireFrame.h"


@implementation NPPointChargeMainWireFrame


#pragma mark - NPCommonWireFrameInterface


- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonWireFrameInterface>)aPresentingWireFrame
{
    [super presentViewControllerFromPresentingViewController:aController presentingWireFrame:aPresentingWireFrame];
    
    if(self.viewController)
    {
        [aController presentViewController:self.viewController animated:YES completion:nil];
    }
}


- (void)dismissViewController:(BOOL)aAnimated;
{
    [self.viewController dismissViewControllerAnimated:aAnimated completion:nil];
}


- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame
{
    [super dismissedPresentedViewController:presentedViewController presentedWireFrame:aPresentedWireFrame];
    
    if([self.viewController presentedViewController])
    {
        [self.viewController dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
