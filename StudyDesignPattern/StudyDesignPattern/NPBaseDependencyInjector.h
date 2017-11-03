//
//  NPBaseDependencyInjector.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NPBaseDependencyInjector : NSObject <NPCommonDependencyInjectorInterface>


@property (strong, nonatomic, readwrite) id<NPCommonWireFrameInterface> wireFrame;
@property (strong, nonatomic, readwrite) id<NPCommonDependencyInjectorInterface> nextDependencyInjector;
@property (strong, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;
@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id interactor;


@end
