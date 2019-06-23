//
//  Pizza.m
//  StudyDesignPattern
//
//  Created by cjyang on 24/06/2019.
//  Copyright © 2019 NHNENT. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

+ (Pizza *)pizzaWithName:(NSString *)aName
{
    Pizza *sResult = nil;
    
    if([aName isEqualToString:@"SeafoodPizza"])
    {
        sResult = [SeafoodPizza new];
    }
    else if([aName isEqualToString:@"CheesePizza"])
    {
        sResult = [CheesePizza new];
    }
    
    return sResult;
}

- (NSNumber *)price
{
    return nil;
}

@end

@implementation SeafoodPizza : Pizza
- (NSNumber *)price
{
    return @(2000);
}
@end

@implementation CheesePizza : Pizza
- (NSNumber *)price
{
    return @(1000);
}
@end
