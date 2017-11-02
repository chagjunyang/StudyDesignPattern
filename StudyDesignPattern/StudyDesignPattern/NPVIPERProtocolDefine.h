//
//  NPVIPERProtocolDefine.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//


@protocol NPCommonDependencyInjectorInterface;
@protocol NPCommonWireFrameInterface;
@protocol NPCommonViewInterface;
@protocol NPCommonPresenterInterface;
@protocol NPCommonInteractorInterface;


#pragma mark - NPCommonDependenciesInterface


@protocol NPCommonDependencyInjectorInterface <NSObject>

@end


#pragma mark - NPCommonWireFrameInterface


@protocol NPCommonWireFrameInterface <NSObject>


@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;

@property (strong, nonatomic, readwrite) id<NPCommonDependencyInjectorInterface> nextDependencyInjector;
@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> nextWireFrame;

@property (weak, nonatomic, readwrite) id<NPCommonPresenterInterface> prevWireFrame;
@property (weak, nonatomic, readwrite) UIViewController *prevContext;

- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonViewInterface>)aPresentingWireFrame;
- (void)dismissViewController;
- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame;


@end


#pragma mark - NPCommonViewInterface


@protocol NPCommonViewInterface <NSObject>

@end


#pragma mark - NPCommonPresenterInterface


@protocol NPCommonPresenterInterface <NSObject>

@end


#pragma mark - NPCommonInteractorInterface


@protocol NPCommonInteractorInterface <NSObject>

@end

