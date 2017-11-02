//
//  NPVIPERProtocolDefine.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//


@protocol NPCommonDependenciesInterface;
@protocol NPCommonWireFrameInterface;
@protocol NPCommonViewInterface;
@protocol NPCommonPresenterInterface;
@protocol NPCommonInteractorInterface;


#pragma mark - NPCommonDependenciesInterface


@protocol NPCommonDependenciesInterface <NSObject>

@end


#pragma mark - NPCommonWireFrameInterface


@protocol NPCommonWireFrameInterface <NSObject>

@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> view;
@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> presenter;
@property (strong, nonatomic, readwrite) id<NPCommonViewInterface> nextWireFrame;
@property (weak, nonatomic, readwrite) UIViewController *prevContext;

- (void)showViewControllerFromContext:(UIViewController *)aController;
- (void)hideViewController;

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

