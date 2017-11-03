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


#pragma mark - NPCommonDependenciesInterface


@protocol NPCommonDependencyInjectorInterface <NSObject>

@required
- (id<NPCommonWireFrameInterface>)wireFrameWithInjectedDependencies;

@end


#pragma mark - NPCommonWireFrameInterface


@protocol NPCommonWireFrameInterface <NSObject>


@required
@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;

@property (strong, nonatomic, readwrite) id<NPCommonDependencyInjectorInterface> nextDependencyInjector;
@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> nextWireFrame;

@property (weak, nonatomic, readonly) id<NPCommonWireFrameInterface> prevWireFrame;
@property (weak, nonatomic, readonly) UIViewController *prevContext;

- (void)presentViewControllerFromPresentingViewController:(UIViewController *)aController
                                      presentingWireFrame:(id<NPCommonWireFrameInterface>)aPresentingWireFrame;
- (void)showNextWireFrame;
- (void)dismissViewController:(BOOL)aAnimated;
- (void)dismissedPresentedViewController:(UIViewController *)presentedViewController
                      presentedWireFrame:(id<NPCommonWireFrameInterface>)aPresentedWireFrame;


@end


#pragma mark - NPCommonViewInterface


@protocol NPCommonViewInterface <NSObject>

@required
@property (weak, nonatomic, readwrite) id<NPCommonPresenterInterface> presenter;

@optional
- (UIEdgeInsets)viewEdgeInsets;
- (void)willDisplayView;
- (void)didEndDisplayView;

@required
- (CGSize)viewSizeForContainerSize:(CGSize)aContainerSize;

@end


#pragma mark - NPCommonPresenterInterface


@protocol NPCommonPresenterInterface <NSObject>

@property (weak, nonatomic, readwrite) id<NPCommonWireFrameInterface> wireFrame;
@property (weak, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id interactor;

@required
- (void)updateView;

@end

