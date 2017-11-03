//
//  NPMainInteractor.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 2..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPMainInteractor.h"


@implementation NPMainInteractor


#pragma mark - NPMainInteractorInterface


- (void)fetchTitleWithCompletion:(void(^)(NSString *aTitle))aCompletion
{
    aCompletion(@"포인트 충전");
}


@end
