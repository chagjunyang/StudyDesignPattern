//
//  NPPointChargeMainWireFrame.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainWireFrame.h"
#import "NPPointChargeMainInteractorProtocolDefine.h"

#pragma mark - popup
#import "NPPointChargePopupProtocolDefine.h"
#import "NPPointChargePopupDependencyInjector.h"


@interface NPPointChargeMainWireFrame()

@property (strong, nonatomic, readonly) id<NPCommonWireFrameInterface> popupWireFrame;

@end


@implementation NPPointChargeMainWireFrame


#pragma mark - NPCommonWireFrameInterface


- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonWireFrameInterface>)aPresentingWireFrame
{
    [super presentViewControllerFromPresentingViewController:aController presentingWireFrame:aPresentingWireFrame];
    
    if([self needToShowingPoupView])
    {
        [self initPopupWireFrame];
        
        [self.popupWireFrame presentViewControllerFromPresentingViewController:aController presentingWireFrame:self];
    }
    else
    {
        if(self.viewController)
        {
            [aController presentViewController:self.viewController animated:YES completion:nil];
        }
    }
}


- (void)dismissViewController:(BOOL)aAnimated;
{
    [self.prevWireFrame dismissedPresentedViewController:self.viewController presentedWireFrame:self];
}


- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame
{
    if([aPresentedWireFrame isEqual:self.popupWireFrame])
    {
        [presentedViewController presentViewController:self.viewController animated:YES completion:^{
            _popupWireFrame = nil;
        }];
    }
    else
    {
        [super dismissedPresentedViewController:presentedViewController presentedWireFrame:aPresentedWireFrame];
        
        if([self.viewController presentedViewController])
        {
            [self.viewController dismissViewControllerAnimated:YES completion:nil];
        }
    }
}


#pragma mark - Private


- (BOOL)needToShowingPoupView
{
    id<NPPointChargeMainInteractorInterface> sInteractor = self.presenter.interactor;
    
    return [sInteractor isNeedToPopupFromUserDefaults];
}


- (void)initPopupWireFrame
{
    NPPointChargePopupDependencyInjector *sInjector = [NPPointChargePopupDependencyInjector new];
    
    _popupWireFrame = [sInjector wireFrameWithInjectedDependencies];
}


@end
