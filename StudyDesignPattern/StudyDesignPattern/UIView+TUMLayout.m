/*
 *  UIView+Layout.m
 *  TOAST UI Common Module
 *
 *  Created by bearkode on 12. 4. 10..
 *  Copyright (c) 2012 NHN Entertainment. All rights reserved.
 *
 */

#import "UIView+TUMLayout.h"


@implementation UIView (TUMLayout)


- (void)TUMDrawBoundsWithColor:(UIColor *)aColor
{
    CGContextRef sContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(sContext);
    CGContextSetStrokeColorWithColor(sContext, [aColor CGColor]);
    CGContextStrokeRect(sContext, [self bounds]);
    CGContextRestoreGState(sContext);
}


#pragma mark -


- (void)TUMSetPosition:(CGPoint)aPoint
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(aPoint.x, aPoint.y, sFrame.size.width, sFrame.size.height)];
}


- (void)TUMSetYPosition:(CGFloat)aY
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(sFrame.origin.x, aY, sFrame.size.width, sFrame.size.height)];
}


- (void)TUMSetXPosition:(CGFloat)aX
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(aX, sFrame.origin.y, sFrame.size.width, sFrame.size.height)];
}


- (void)TUMSetSize:(CGSize)aSize
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(sFrame.origin.x, sFrame.origin.y, aSize.width, aSize.height)];
    
}


- (void)TUMSetWidth:(CGFloat)aWidth
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(sFrame.origin.x, sFrame.origin.y, aWidth, sFrame.size.height)];
}


- (void)TUMSetHeight:(CGFloat)aHeight
{
    CGRect sFrame = [self frame];
    
    [self setFrame:CGRectMake(sFrame.origin.x, sFrame.origin.y, sFrame.size.width, aHeight)];
}


#pragma mark -


- (void)TUMWidthToFit
{
    CGRect sFrame1 = [self frame];
    [self sizeToFit];
    
    CGRect sFrame2 = [self frame];
    sFrame2.size.width = sFrame1.size.width;
    
    [self setFrame:sFrame2];
}


- (void)TUMHeightToFit
{
    CGRect sFrame1 = [self frame];
    [self sizeToFit];
    
    CGRect sFrame2 = [self frame];
    sFrame2.size.height = sFrame1.size.height;
    
    [self setFrame:sFrame2];
}


#pragma mark -


- (void)TUMMoveToRightOf:(UIView *)aView gap:(CGFloat)aGap
{
    CGRect sFrame1 = [self frame];
    CGRect sFrame2 = [aView frame];
    
    sFrame1.origin.x = sFrame2.origin.x + sFrame2.size.width + aGap;
    
    [self setFrame:sFrame1];
}


- (void)TUMMoveToBottomOf:(UIView *)aView gap:(CGFloat)aGap
{
    CGRect sFrame1 = [self frame];
    CGRect sFrame2 = [aView frame];
    
    sFrame1.origin.y = sFrame2.origin.y + sFrame2.size.height + aGap;
    
    [self setFrame:sFrame1];
}


- (void)TUMMoveToLeftOf:(UIView *)aView gap:(CGFloat)aGap
{
    CGRect sFrame1 = [self frame];
    CGRect sFrame2 = [aView frame];
    
    sFrame1.origin.x = sFrame2.origin.x - sFrame1.size.width - aGap;
    
    [self setFrame:sFrame1];
}


- (void)TUMMoveToTopOf:(UIView *)aView gap:(CGFloat)aGap
{
    CGRect sFrame1 = [self frame];
    CGRect sFrame2 = [aView frame];
    
    sFrame1.origin.y = sFrame2.origin.y - sFrame1.size.height - aGap;
    
    [self setFrame:sFrame1];
}


#pragma mark -


- (void)TUMMoveToBottomWithMargin:(CGFloat)aMargin
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.y = (NSInteger)([[self superview] frame].size.height - sFrame.size.height - aMargin);
    [self setFrame:sFrame];
}


- (void)TUMMoveToRightWithMargin:(CGFloat)aMargin
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.x = (NSInteger)([[self superview] frame].size.width - sFrame.size.width - aMargin);
    [self setFrame:sFrame];
}


- (void)TUMMoveToTopRightWithMargin:(CGSize)aMargin
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.x = (NSInteger)([[self superview] frame].size.width - sFrame.size.width - aMargin.width);
    sFrame.origin.y = (NSInteger)aMargin.height;
    [self setFrame:sFrame];
}


- (void)TUMMoveToBottomLeftWithMargin:(CGSize)aMargin
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.x = (NSInteger)aMargin.width;
    sFrame.origin.y = (NSInteger)([[self superview] frame].size.height - sFrame.size.height - aMargin.height);
    [self setFrame:sFrame];
}


- (void)TUMMoveToBottomRightWithMargin:(CGSize)aMargin
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.x = (NSInteger)([[self superview] frame].size.width - sFrame.size.width - aMargin.width);
    sFrame.origin.y = (NSInteger)([[self superview] frame].size.height - sFrame.size.height - aMargin.height);
    [self setFrame:sFrame];
}


#pragma mark -


- (void)TUMMoveToHorizontalCenter
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.x = (NSInteger)(([[self superview] frame].size.width - sFrame.size.width) / 2);
    [self setFrame:sFrame];
}


- (void)TUMMoveToVerticalCenter
{
    NSAssert([self superview], @"");
    
    CGRect sFrame = [self frame];
    
    sFrame.origin.y = (NSInteger)(([[self superview] frame].size.height - sFrame.size.height) / 2);
    [self setFrame:sFrame];
}


#pragma mark -


+ (void)TUMAlignViews:(NSArray *)aViews mode:(TUMViewLayoutAlignMode)aAlignMode
{
    NSParameterAssert([aViews count] > 1);
    
    CGRect sBaseFrame = [[aViews objectAtIndex:0] frame];
    
    for (UIView *sView in aViews)
    {
        CGRect sFrame = [sView frame];
        
        if (aAlignMode == TUMViewLayoutAlignModeLeft)
        {
            sFrame.origin.x = sBaseFrame.origin.x;
        }
        else if (aAlignMode == TUMViewLayoutAlignModeRight)
        {
            sFrame.origin.x = CGRectGetMaxX(sBaseFrame) - sFrame.size.width;
        }
        else if (aAlignMode == TUMViewLayoutAlignModeCenter)
        {
            sFrame.origin.x = CGRectGetMidX(sBaseFrame) - sFrame.size.width / 2.0;
        }
        else if (aAlignMode == TUMViewLayoutAlignModeTop)
        {
            sFrame.origin.y = sBaseFrame.origin.y;
        }
        else if (aAlignMode == TUMViewLayoutAlignModeBottom)
        {
            sFrame.origin.y = CGRectGetMaxY(sBaseFrame) - sFrame.size.height;
        }
        else if (aAlignMode == TUMViewLayoutAlignModeMiddle)
        {
            sFrame.origin.y = CGRectGetMidY(sBaseFrame) - sFrame.size.height / 2.0;
        }
        
        [sView setFrame:sFrame];
    }
    
}


@end
