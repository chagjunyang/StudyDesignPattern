//
//  NPMainPresenter.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainViewProtocolDefine.h"
#import "NPMainPresenterProtocolDefine.h"
#import "NPMainInteractorProtocolDefine.h"


@interface NPMainPresenter : NSObject <NPMainPresenterInterface>


@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> wireFrame;
@property (weak, nonatomic, readwrite) id<NPMainViewInterface> view;
@property (strong, nonatomic, readwrite) id<NPMainInteractorInterface> interactor;


@end
