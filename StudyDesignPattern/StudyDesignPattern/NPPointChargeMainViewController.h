//
//  NPPointChargeMainViewController.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainViewProtocolDefine.h"
#import "NPPointChargeMainPresenterProtocolDefine.h"


@interface NPPointChargeMainViewController : UIViewController <NPPointChargeMainViewInterface>

@property (weak, nonatomic, readwrite) id<NPPointChargeMainPresenterInterface> presenter;

@end
