//
//  AddressBookTableViewCell.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddressBookTableViewCell : UITableViewCell


@property (strong, nonatomic, readonly) UILabel *nameLabel;
@property (strong, nonatomic, readonly) UILabel *addressLabel;
@property (strong, nonatomic, readonly) UILabel *phoneNumberLabel;
@property (strong, nonatomic, readonly) UIButton *callButton;


@end
