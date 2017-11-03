//
//  NPMainPresenter.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainPresenter.h"


@implementation NPMainPresenter


- (void)updateView
{
    [self.interactor fetchTitleWithCompletion:^(NSString *aTitle) {
        [self.view setPointChargeButtonTitle:aTitle];
    }];
}


- (void)tappedChargeButton:(id)aSender
{
    [self.wireFrame showNextWireFrame];
}


@end
