//
//  NPBasePresenter.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NPBasePresenter : NSObject <NPCommonPresenterInterface>


@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> wireFrame;
@property (weak, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id interactor;


@end
