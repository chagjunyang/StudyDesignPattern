//
//  AddressBookTableViewCell.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AddressBookTableViewCell.h"

#import "UIView+TUMLayout.h"


static CGFloat const kContentsHorizontalMargin = 15;
static CGFloat const kNameLabelMarginTop = 10;
static CGFloat const kAddressLabelMarginTop = 15;
static CGFloat const kCallButtonMarginTop = 10;
static CGFloat const kCallButtonMarginBottom = 15;


@interface AddressBookTableViewCell()

@end


@implementation AddressBookTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [self setupNameLabel];
        [self setupAddressLabel];
        [self setupPhoneNumberLabel];
        [self setupCallButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.nameLabel TUMSetPosition:CGPointMake(kContentsHorizontalMargin, 20)];
    
    [self.addressLabel TUMMoveToBottomOf:self.nameLabel gap:kAddressLabelMarginTop];
    [self.addressLabel TUMSetXPosition:kContentsHorizontalMargin];
    
    [self.callButton TUMMoveToBottomOf:self.addressLabel gap:kCallButtonMarginTop];
    [self.callButton TUMMoveToRightWithMargin:kContentsHorizontalMargin];

    [self.phoneNumberLabel TUMSetXPosition:kContentsHorizontalMargin];
    [UIView TUMAlignViews:@[self.callButton, self.phoneNumberLabel] mode:TUMViewLayoutAlignModeMiddle];
}


- (CGSize)sizeThatFits:(CGSize)size
{
    [self.nameLabel sizeToFit];
    [self.addressLabel sizeToFit];
    [self.phoneNumberLabel sizeToFit];
    [self.callButton TUMSetSize:CGSizeMake(100, 50)];
    
    return CGSizeMake(size.width, [self cellHeight]);
}


- (CGFloat)cellHeight
{
    CGFloat sCellHeight = 0;
    
    sCellHeight += kNameLabelMarginTop;
    sCellHeight += CGRectGetHeight(self.nameLabel.bounds);
    sCellHeight += kAddressLabelMarginTop;
    sCellHeight += CGRectGetHeight(self.addressLabel.bounds);
    sCellHeight += kCallButtonMarginTop;
    sCellHeight += CGRectGetHeight(self.callButton.bounds);
    sCellHeight += kCallButtonMarginBottom;
    
    return sCellHeight;
}


#pragma mark - Setup


- (void)setupNameLabel
{
    _nameLabel = [UILabel new];
    
    [self.nameLabel setFont:[UIFont systemFontOfSize:13]];
    [self.nameLabel setTextColor:[UIColor blackColor]];
    
    [[self contentView] addSubview:self.nameLabel];
}


- (void)setupAddressLabel
{
    _addressLabel = [UILabel new];
    
    [self.addressLabel setFont:[UIFont systemFontOfSize:12]];
    [self.addressLabel setTextColor:[UIColor grayColor]];
    
    [[self contentView] addSubview:self.addressLabel];
}


- (void)setupPhoneNumberLabel
{
    _phoneNumberLabel = [UILabel new];
    
    [self.phoneNumberLabel setFont:[UIFont systemFontOfSize:12]];
    [self.phoneNumberLabel setTextColor:[UIColor grayColor]];
    
    [[self contentView] addSubview:self.phoneNumberLabel];
}


- (void)setupCallButton
{
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [[self.callButton titleLabel] setFont:[UIFont systemFontOfSize:14]];
    [self.callButton setTitle:@"전화걸기" forState:UIControlStateNormal];
    [self.callButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.callButton setBackgroundColor:[UIColor greenColor]];
    
    [[self contentView] addSubview:self.callButton];
}


@end
