//
//  NPPointChargeMainViewController.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainViewProtocolDefine.h"


@interface NPPointChargeMainViewController : UIViewController <NPPointChargeMainViewInterfact>

@property (weak, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;

@end
