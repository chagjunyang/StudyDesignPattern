//
//  AddressBookTableViewCell.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddressBookItemServiceModel;

@protocol AddressBookTableViewCellDelegate;


@interface AddressBookTableViewCell : UITableViewCell


@property (weak, nonatomic, readwrite) id<AddressBookTableViewCellDelegate> delegate;
@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *addressLabel;
@property (strong, nonatomic, readonly) UIButton *callButton;

- (void)updateCellWithViewModel:(AddressBookItemServiceModel *)aViewModel;


@end


#pragma mark - AddressBookTableViewCellDelegate


@protocol AddressBookTableViewCellDelegate <NSObject>


- (void)tappedCallButtonAtAddressBookItemCell:(AddressBookTableViewCell *)aCell;


@end
