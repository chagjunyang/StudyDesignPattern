//
//  NPMainInteractorProtocolDefine.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

@protocol NPMainInteractorInterface <NSObject>

- (void)fetchTitleWithCompletion:(void(^)(NSString *aTitle))aCompletion;

@end
