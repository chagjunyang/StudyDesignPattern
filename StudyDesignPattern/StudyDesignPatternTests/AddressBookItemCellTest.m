//
//  AddressBookItemCellTest.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 10. 10..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AddressBookTableViewCell.h"
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
    
    AddressBookTableViewCell *includedPhoneNumberItemCell = [AddressBookTableViewCell new];
    AddressBookTableViewCell *notIncludedPhoneNumberItemCell = [AddressBookTableViewCell new];
    
    [includedPhoneNumberItemCell updateCellWithAddressBookItem:includedPhoneNumberItem];
    [notIncludedPhoneNumberItemCell updateCellWithAddressBookItem:notIncludedPhoneNumberItem];
    
    NSString *includedPhoneNumberNameLabelText = [includedPhoneNumberItemCell.nameLabel text];
    NSString *notIncludedPhoneNumberNameLabelText = [notIncludedPhoneNumberItemCell.nameLabel text];
    
    XCTAssertTrue([includedPhoneNumberNameLabelText isEqualToString:@"홍길동 (01012341111)"]);
    XCTAssertTrue([notIncludedPhoneNumberNameLabelText isEqualToString:@"김하늘"]);
}


- (void)testButtonState
{
    AddressBookItem *includedPhoneNumberItem = [self.addressBookItems objectAtIndex:0];
    AddressBookItem *notIncludedPhoneNumberItem = [self.addressBookItems objectAtIndex:1];
    
    AddressBookTableViewCell *includedPhoneNumberItemCell = [AddressBookTableViewCell new];
    AddressBookTableViewCell *notIncludedPhoneNumberItemCell = [AddressBookTableViewCell new];
    
    [includedPhoneNumberItemCell updateCellWithAddressBookItem:includedPhoneNumberItem];
    [notIncludedPhoneNumberItemCell updateCellWithAddressBookItem:notIncludedPhoneNumberItem];
    
    XCTAssertFalse([includedPhoneNumberItemCell.callButton isHidden]);
    XCTAssertTrue([notIncludedPhoneNumberItemCell.callButton isHidden]);
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
