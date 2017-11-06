//
//  NPPointChargePopupPresenter.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargePopupPresenter.h"
#import "NPPointChargePopupInteractor.h"


@implementation NPPointChargePopupPresenter


- (void)updateViewWithCompletion:(dispatch_block_t)aCompletion
{
    id<NPPointChargePopupViewInterface> sView = (id<NPPointChargePopupViewInterface>)self.view;
    
    [sView setGuideText:@"포인트 충전 유의사항을 확인하세요."];
    [sView setConfirmButtonTitle:@"확인"];
    
    if(aCompletion)
    {
        aCompletion();
    }
}


#pragma mark - NPPointChargePopupPresenterInterface


- (void)tappedConfirmButton:(id)aSender
{
    id<NPPointChargePopupInteractorInterface> sInteractor = self.interactor;
    
    [sInteractor savePopShowingToUserDefaultsWithCompletion:^{
        [self.wireFrame dismissViewController:YES];
    }];
}


@end
