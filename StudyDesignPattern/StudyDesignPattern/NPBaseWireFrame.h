//
//  NPBaseWireFrame.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//


@interface NPBaseWireFrame : NSObject <NPCommonWireFrameInterface>


@property (strong, nonatomic, readwrite) UIViewController *viewController;
@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;

@property (strong, nonatomic, readwrite) id<NPCommonDependencyInjectorInterface> nextDependencyInjector;
@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> nextWireFrame;

@property (weak, nonatomic, readonly) id<NPCommonWireFrameInterface> prevWireFrame;
@property (weak, nonatomic, readonly) UIViewController *prevContext;

- (id<NPCommonWireFrameInterface>)nextWireFrameFromDependencyInjector;
- (UIViewController *)viewControllerFromView;


@end
