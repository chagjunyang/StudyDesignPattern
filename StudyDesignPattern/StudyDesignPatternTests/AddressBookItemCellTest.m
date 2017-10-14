//
//  AddressBookItemCellTest.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 10. 10..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AddressBookItemServiceModel.h"
#import "AddressBookItem.h"


@interface AddressBookItemCellTest : XCTestCase

@property (strong, nonatomic, readwrite) NSArray <AddressBookItem *> *addressBookItems;

@end


@implementation AddressBookItemCellTest


- (void)setUp
{
    [super setUp];
    
    [self setupAddressBookItems];
}


- (void)testNameData
{
    AddressBookItem *includedPhoneNumberItem = [self.addressBookItems objectAtIndex:0];
    AddressBookItem *notIncludedPhoneNumberItem = [self.addressBookItems objectAtIndex:1];
    
    AddressBookItemServiceModel *includedPhoneNumberCellViewModel = [AddressBookItemServiceModel new];
    AddressBookItemServiceModel *notIncludedPhoneNumberCellViewModel = [AddressBookItemServiceModel new];
    
    [includedPhoneNumberCellViewModel injectValueObject:includedPhoneNumberItem];
    [notIncludedPhoneNumberCellViewModel injectValueObject:notIncludedPhoneNumberItem];
    
    XCTAssertTrue([includedPhoneNumberCellViewModel.name isEqualToString:@"홍길동 (01012341111)"]);
    XCTAssertTrue([notIncludedPhoneNumberCellViewModel.name isEqualToString:@"김하늘"]);
}


- (void)testButtonState
{
    AddressBookItem *includedPhoneNumberItem = [self.addressBookItems objectAtIndex:0];
    AddressBookItem *notIncludedPhoneNumberItem = [self.addressBookItems objectAtIndex:1];
    
    AddressBookItemServiceModel *includedPhoneNumberCellViewModel = [AddressBookItemServiceModel new];
    AddressBookItemServiceModel *notIncludedPhoneNumberCellViewModel = [AddressBookItemServiceModel new];
    
    [includedPhoneNumberCellViewModel injectValueObject:includedPhoneNumberItem];
    [notIncludedPhoneNumberCellViewModel injectValueObject:notIncludedPhoneNumberItem];
    
    XCTAssertFalse(includedPhoneNumberCellViewModel.callButtonHidden);
    XCTAssertTrue(notIncludedPhoneNumberCellViewModel.callButtonHidden);
}


#pragma mark -


- (void)setupAddressBookItems
{
    NSMutableArray<AddressBookItem *> *addressBookItems = [NSMutableArray new];
    NSArray<NSDictionary *> *addressBookJSONArray = [self objectForJSONFileName:@"addressBook"];
    
    for(NSDictionary *addressBookJSONDict in addressBookJSONArray)
    {
        [addressBookItems addObject:[[AddressBookItem alloc] initWithJSONObject:addressBookJSONDict]];
    }
    
    _addressBookItems = [NSArray arrayWithArray:addressBookItems];
}


- (id)objectForJSONFileName:(NSString *)aFileName
{
    NSString *sPath = [[NSBundle bundleForClass:[self class]] pathForResource:aFileName ofType:@"json"];
    NSData   *sData = [NSData dataWithContentsOfFile:sPath];
    
    return [NSJSONSerialization JSONObjectWithData:sData options:kNilOptions error:nil];
}


@end
