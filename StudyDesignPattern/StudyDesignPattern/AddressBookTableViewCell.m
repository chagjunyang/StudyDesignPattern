//
//  AddressBookTableViewCell.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 9. 30..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "AddressBookTableViewCell.h"

#import "AddressBookItemServiceModel.h"

#import "UIView+TUMLayout.h"


static CGFloat const kContentsHorizontalMargin = 15;
static CGFloat const kNameLabelMarginTop = 10;
static CGFloat const kAddressLabelMarginTop = 15;
static CGFloat const kAddressLabelMarginBottom = 15;
static CGFloat const kCallButtonMarginTop = 10;


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
        [self setupCallButton];
    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.nameLabel TUMSetPosition:CGPointMake(kContentsHorizontalMargin, kNameLabelMarginTop)];
    
    [self.addressLabel TUMMoveToBottomOf:self.nameLabel gap:kAddressLabelMarginTop];
    [self.addressLabel TUMSetXPosition:kContentsHorizontalMargin];
    
    [self.callButton TUMSetYPosition:kCallButtonMarginTop];
    [self.callButton TUMMoveToRightWithMargin:kContentsHorizontalMargin];
}


- (CGSize)sizeThatFits:(CGSize)size
{
    [self.nameLabel sizeToFit];
    [self.addressLabel sizeToFit];
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
    sCellHeight += kAddressLabelMarginBottom;
    
    return sCellHeight;
}


#pragma mark - Public


- (void)updateCellWithViewModel:(AddressBookItemServiceModel *)aViewModel
{
    [self.nameLabel setText:aViewModel.name];
    [self.addressLabel setText:aViewModel.address];
    [self.callButton addTarget:self action:@selector(tappedCallButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.callButton setHidden:[aViewModel callButtonHidden]];
}


#pragma mark - Action


- (void)tappedCallButton:(id)aSender
{
    if([self.delegate respondsToSelector:@selector(tappedCallButtonAtAddressBookItemCell:)])
    {
        [self.delegate tappedCallButtonAtAddressBookItemCell:self];
    }
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


- (void)setupCallButton
{
    _callButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [[self.callButton titleLabel] setFont:[UIFont systemFontOfSize:14]];
    [self.callButton setTitle:@"전화걸기" forState:UIControlStateNormal];
    [self.callButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.callButton setBackgroundColor:[UIColor greenColor]];
    [self.callButton addTarget:self action:@selector(tappedCallButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self contentView] addSubview:self.callButton];
}


@end
