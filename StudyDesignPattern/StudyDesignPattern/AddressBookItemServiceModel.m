//
//  AddressBookItemServiceModel.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 10. 14..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AddressBookItemServiceModel.h"
#import "AddressBookItem.h"


@implementation AddressBookItemServiceModel


- (void)injectValueObject:(AddressBookItem *)aItem
{
    _name = [self nameLabelTextFromAddressBookItem:aItem];
    _address = aItem.address;
    _callButtonHidden = ![aItem.phoneNumber length];
}


#pragma mark - Private


- (NSString *)nameLabelTextFromAddressBookItem:(AddressBookItem *)item
{
    NSString *nameLabelText = item.name;
    
    if([item.phoneNumber length])
    {
        nameLabelText = [nameLabelText stringByAppendingString:[NSString stringWithFormat:@" (%@)", item.phoneNumber]];
    }
    
    return nameLabelText;
}


@end
