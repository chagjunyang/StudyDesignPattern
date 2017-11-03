//
//  NPBaseCollectionViewCell.h
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//


@interface NPBaseCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic, readwrite) UIView *subView;
@property (assign, nonatomic, readwrite) UIEdgeInsets subViewEdgeInsets;


@end
