//
//  NPPointChargeMainPresenter.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainPresenter.h"
#import "NPPointChargeMainViewProtocolDefine.h"


@interface NPPointChargeMainPresenter()

@property (weak, nonatomic, readwrite) id<NPPointChargeMainViewInterface> mainView;

@end


@implementation NPPointChargeMainPresenter


- (void)updateView
{
    _mainView = (id<NPPointChargeMainViewInterface>)self.view;
    
    [self.mainView setConfirmButtonTitle:@"확인"];
    
}


- (void)tappedConfirmButton:(id)aSender
{
    [self.wireFrame dismissViewController:YES];
}


@end
