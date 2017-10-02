//
//  AddressBookViewControllerTest.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 10. 1..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AddressBookItem.h"
#import "AddressBookTableViewCell.h"


@interface AddressBookViewControllerForTest : UIViewController


@property (strong, nonatomic, readwrite) NSArray <AddressBookItem *> *addressBookItems;


- (void)bindAddressBookItemToCell:(AddressBookTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

- (NSString *)nameLabelTextFromAddressBookItem:(AddressBookItem *)item;


@end


@implementation AddressBookViewControllerForTest


- (void)bindAddressBookItemToCell:(AddressBookTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    AddressBookItem *item = [self.addressBookItems objectAtIndex:indexPath.row];
    
    [cell.nameLabel setText:[self nameLabelTextFromAddressBookItem:item]];
    [cell.addressLabel setText:item.address];
    [cell.callButton setTag:indexPath.row];
    [cell.callButton setHidden:![item.phoneNumber length]];
}


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


@interface AddressBookViewControllerTest : XCTestCase


@property (strong, nonatomic, readwrite) AddressBookViewControllerForTest *addressBookViewController;
@property (strong, nonatomic, readwrite) AddressBookTableViewCell *tableViewCell;


@end


@implementation AddressBookViewControllerTest


- (void)setUp
{
    [super setUp];
    
    _tableViewCell = [AddressBookTableViewCell new];
 
    [self setupAddressBookViewController];
}


- (void)tearDown
{
    [super tearDown];
}


- (void)nameDataTest
{
    AddressBookItem *includedPhoneNumberItem = [self.addressBookViewController.addressBookItems objectAtIndex:0];
    AddressBookItem *notIncludedPhoneNumberItem = [self.addressBookViewController.addressBookItems objectAtIndex:1];
    
    NSString *includedPhoneNumberNameLabelText = [self.addressBookViewController nameLabelTextFromAddressBookItem:includedPhoneNumberItem];
    NSString *notIncludedPhoneNumberNameLabelText = [self.addressBookViewController nameLabelTextFromAddressBookItem:notIncludedPhoneNumberItem];
    
    XCTAssertTrue([includedPhoneNumberNameLabelText isEqualToString:@"홍길동 (01012341111)"]);
    XCTAssertTrue([notIncludedPhoneNumberNameLabelText isEqualToString:@"김하늘"]);
}


- (void)buttonStateTest
{
    AddressBookTableViewCell *includedPhoneNumberCell = [AddressBookTableViewCell new];
    AddressBookTableViewCell *notIncludedPhoneNumberCell = [AddressBookTableViewCell new];
    
    [self.addressBookViewController bindAddressBookItemToCell:includedPhoneNumberCell atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.addressBookViewController bindAddressBookItemToCell:notIncludedPhoneNumberCell atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    XCTAssertFalse([includedPhoneNumberCell.callButton isHidden]);
    XCTAssertTrue([includedPhoneNumberCell.callButton isHidden]);
}


#pragma mark - Private


- (void)setupAddressBookViewController
{
    _addressBookViewController = [AddressBookViewControllerForTest new];
    
    NSMutableArray<AddressBookItem *> *addressBookItems = [NSMutableArray new];
    NSArray<NSDictionary *> *addressBookJSONArray = [self objectForJSONFileName:@"addressBook"];
    
    for(NSDictionary *addressBookJSONDict in addressBookJSONArray)
    {
        [addressBookItems addObject:[[AddressBookItem alloc] initWithJSONObject:addressBookJSONDict]];
    }
    
    [self.addressBookViewController setAddressBookItems:[NSArray arrayWithArray:addressBookItems]];
}


- (id)objectForJSONFileName:(NSString *)aFileName
{
    NSString *sPath = [[NSBundle bundleForClass:[self class]] pathForResource:aFileName ofType:@"json"];
    NSData   *sData = [NSData dataWithContentsOfFile:sPath];
    
    return [NSJSONSerialization JSONObjectWithData:sData options:kNilOptions error:nil];
}


@end
