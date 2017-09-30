//
//  AddressBookItem.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AddressBookItem : NSObject


@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *address;
@property (strong, nonatomic, readonly) NSString *phoneNumber;

- (void)initWithJSONObject:(NSDictionary *)aJSONObject;


@end
