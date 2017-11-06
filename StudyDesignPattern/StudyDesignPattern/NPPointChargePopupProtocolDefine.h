//
//  NPPointChargePopupProtocolDefine.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 6..
//  Copyright © 2017년 NHNENT. All rights reserved.
//


#pragma mark - NPPointChargePopupViewInterface


@protocol NPPointChargePopupViewInterface <NPCommonViewInterface>


- (void)setGuideText:(NSString *)aString;
- (void)setConfirmButtonTitle:(NSString *)aTitle;


@end


#pragma mark - NPPointChargePopupPresenterInterface


@protocol NPPointChargePopupPresenterInterface <NPCommonPresenterInterface>


- (void)tappedConfirmButton:(id)aSender;


@end


#pragma mark - NPPointChargePopupInteractorInterface


@protocol NPPointChargePopupInteractorInterface <NSObject>


- (void)savePopShowingToUserDefaultsWithCompletion:(dispatch_block_t)aCompletion;


@end

