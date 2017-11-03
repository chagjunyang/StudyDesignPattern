//
//  NPBaseCollectionViewCell.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPBaseCollectionViewCell.h"


@implementation NPBaseCollectionViewCell


- (instancetype)initWithFrame:(CGRect)aFrame
{
    self = [super initWithFrame:aFrame];
    
    if(self)
    {
        [self setBackgroundColor:[UIColor clearColor]];
    }
    
    return self;
}


#pragma mark - override


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.subView TUMSetPosition:CGPointMake(self.subViewEdgeInsets.left, self.subViewEdgeInsets.top)];
}


- (CGSize)sizeThatFits:(CGSize)aSize
{
    if(CGRectGetWidth(self.subView.bounds) == 0 || CGRectGetHeight(self.subView.bounds) == 0)
    {
        [self.subView TUMSetSize:aSize];
        [self.subView sizeToFit];
    }
    
    aSize.height = CGRectGetHeight(self.subView.bounds);
    aSize.height += self.subViewEdgeInsets.top;
    aSize.height += self.subViewEdgeInsets.bottom;
    
    [self setNeedsLayout];
    
    return aSize;
}


- (void)setSubView:(UIView *)aSubView
{
    for(UIView *sView in self.contentView.subviews)
    {
        [sView removeFromSuperview];
    }
    
    _subView = aSubView;
    
    if(self.subView)
    {
        [[self contentView] addSubview:self.subView];
    }
}


@end


