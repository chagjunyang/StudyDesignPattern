//
//  NPMainViewController.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainViewProtocolDefine.h"
#import "NPMainPresenterProtocolDefine.h"


@interface NPMainViewController : UIViewController <NPMainViewInterface>


@property (weak, nonatomic, readwrite) id<NPMainPresenterInterface> presenter;


@end
