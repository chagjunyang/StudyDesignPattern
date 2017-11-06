//
//  NPPointChargePopupViewController.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargePopupProtocolDefine.h"


@interface NPPointChargePopupViewController : UIViewController <NPPointChargePopupViewInterface>


@property (weak, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;


@end
