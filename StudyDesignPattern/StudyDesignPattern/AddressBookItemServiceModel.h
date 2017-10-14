//
//  AddressBookItemServiceModel.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 10. 14..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AddressBookItem;


@interface AddressBookItemServiceModel : NSObject


@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSString *address;
@property (assign, nonatomic, readonly) BOOL callButtonHidden;

- (void)injectValueObject:(AddressBookItem *)aItem;


@end
