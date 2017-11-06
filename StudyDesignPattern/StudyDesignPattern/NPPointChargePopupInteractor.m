//
//  NPPointChargePopupInteractor.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargePopupInteractor.h"


@implementation NPPointChargePopupInteractor


- (BOOL)isNeedToPopupFromUserDefaults
{
    return YES;
}


- (void)savePopShowingToUserDefaultsWithCompletion:(dispatch_block_t)aCompletion
{
    if(aCompletion)
    {
        aCompletion();
    }
}


@end
