//
//  AddressBookItem.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AddressBookItem.h"


@implementation AddressBookItem


- (instancetype)initWithJSONObject:(NSDictionary *)aJSONObject
{
    self = [super init];
    
    if(self)
    {
        _name = [aJSONObject objectForKey:@"name"];
        _address = [aJSONObject objectForKey:@"address"];
        _phoneNumber = [aJSONObject objectForKey:@"phoneNumber"];
    }
    
    return self;
}


@end
