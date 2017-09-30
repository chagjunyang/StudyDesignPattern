/*
 *  UIView+Layout
 *  TOAST UI Common Module
 *
 *  Created by bearkode on 12. 4. 10..
 *  Copyright (c) 2012 NHN Entertainment. All rights reserved.
 *
 */

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, TUMViewLayoutAlignMode)
{
    TUMViewLayoutAlignModeLeft = 0,
    TUMViewLayoutAlignModeCenter,
    TUMViewLayoutAlignModeRight,
    TUMViewLayoutAlignModeTop,
    TUMViewLayoutAlignModeMiddle,
    TUMViewLayoutAlignModeBottom
};


@interface UIView (TUMLayout)


- (void)TUMDrawBoundsWithColor:(UIColor *)aColor;


- (void)TUMSetPosition:(CGPoint)aPoint;
- (void)TUMSetYPosition:(CGFloat)aY;
- (void)TUMSetXPosition:(CGFloat)aX;

- (void)TUMSetSize:(CGSize)aSize;
- (void)TUMSetWidth:(CGFloat)aWidth;
- (void)TUMSetHeight:(CGFloat)aHeight;


- (void)TUMWidthToFit;
- (void)TUMHeightToFit;


- (void)TUMMoveToRightOf:(UIView *)aView gap:(CGFloat)aGap;
- (void)TUMMoveToBottomOf:(UIView *)aView gap:(CGFloat)aGap;
- (void)TUMMoveToLeftOf:(UIView *)aView gap:(CGFloat)aGap;
- (void)TUMMoveToTopOf:(UIView *)aView gap:(CGFloat)aGap;


- (void)TUMMoveToBottomWithMargin:(CGFloat)aMargin;
- (void)TUMMoveToRightWithMargin:(CGFloat)aMargin;
- (void)TUMMoveToTopRightWithMargin:(CGSize)aMargin;
- (void)TUMMoveToBottomLeftWithMargin:(CGSize)aMargin;
- (void)TUMMoveToBottomRightWithMargin:(CGSize)aMargin;


- (void)TUMMoveToHorizontalCenter;
- (void)TUMMoveToVerticalCenter;


+ (void)TUMAlignViews:(NSArray *)aViews mode:(TUMViewLayoutAlignMode)aAlignMode;


@end
