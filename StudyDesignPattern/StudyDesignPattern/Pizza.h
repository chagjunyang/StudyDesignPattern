//
//  Pizza.h
//  StudyDesignPattern
//
//  Created by cjyang on 24/06/2019.
//  Copyright © 2019 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Pizza : NSObject

- (NSNumber *)price;
+ (Pizza *)pizzaWithName:(NSString *)aName;

@end

@interface SeafoodPizza : Pizza
@end

@interface CheesePizza : Pizza
@end

NS_ASSUME_NONNULL_END
