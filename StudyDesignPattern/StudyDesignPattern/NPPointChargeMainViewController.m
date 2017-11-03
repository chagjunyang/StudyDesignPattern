//
//  NPPointChargeMainViewController.m
//  StudyDesignPattern
//
//  Created by cjyang on 2017. 11. 3..
//  Copyright © 2017년 NHNENT. All rights reserved.
//

#import "NPPointChargeMainViewController.h"

#import "NPBaseCollectionViewCell.h"


@interface NPPointChargeMainViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic, readwrite) UICollectionView *collectionView;
@property (strong, nonatomic, readonly) UIButton *confirmButton;

@end


@implementation NPPointChargeMainViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    [self setupCollectionView];
    [self setupConfirmButton];
    
    [self.presenter updateView];
}


- (void)viewWillAppear:(BOOL)aAnimated
{
    [super viewWillAppear:aAnimated];
    [[self navigationController] setNavigationBarHidden:YES animated:aAnimated];
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self setSubviewsSizeAndPosition];
}


#pragma mark - Private


- (void)setSubviewsSizeAndPosition
{
    [self.confirmButton TUMSetSize:CGSizeMake([DeviceInfo deviceSize].width, 50)];
    CGFloat sCollectionViewHeight = CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.confirmButton.bounds);
    
    [self.collectionView TUMSetSize:CGSizeMake(CGRectGetWidth(self.view.bounds), sCollectionViewHeight)];
    [self.collectionView TUMSetPosition:CGPointZero];
    
    [self.confirmButton TUMSetXPosition:0];
    [self.confirmButton TUMMoveToBottomWithMargin:0];
}


- (CGSize)viewSizeForContainerSize:(CGSize)aContainerSize
{
    return [DeviceInfo deviceSize];
}


#pragma mark - NPPointChargeMainViewInterface


- (void)setConfirmButtonTitle:(NSString *)aTitle
{
    [self.confirmButton setTitle:aTitle forState:UIControlStateNormal];
}


#pragma mark - setup


- (void)setupCollectionView
{
    UICollectionViewFlowLayout *sFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    [sFlowLayout setSectionInset:UIEdgeInsetsZero];
    [sFlowLayout setMinimumInteritemSpacing:0];
    [sFlowLayout setMinimumLineSpacing:0];
    [sFlowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) collectionViewLayout:sFlowLayout];
    
    [self.collectionView registerClass:[NPBaseCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([NPBaseCollectionViewCell class])];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    [self.collectionView setContentOffset:CGPointZero];
    [self.collectionView setContentInset:UIEdgeInsetsZero];
    [self.collectionView setBounces:NO];
    [self.collectionView setScrollEnabled:YES];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.collectionView];
}


- (void)setupConfirmButton
{
    _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.confirmButton addTarget:self action:@selector(tappedConfirmButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.confirmButton setBackgroundColor:[UIColor redColor]];
    
    [self.view addSubview:self.confirmButton];
}


#pragma mark - Action


- (void)tappedConfirmButton:(id)aSender
{
    if([self.presenter respondsToSelector:@selector(tappedConfirmButton:)])
    {
        [self.presenter tappedConfirmButton:aSender];
    }
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)aCollectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)aCollectionView numberOfItemsInSection:(NSInteger)aSection
{
    return 0;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)aCollectionView cellForItemAtIndexPath:(NSIndexPath *)aIndexPath
{
    return [aCollectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([NPBaseCollectionViewCell class]) forIndexPath:aIndexPath];
}


#pragma mark - UICollectionViewDelegat


- (void)collectionView:(UICollectionView *)aCollectionView willDisplayCell:(UICollectionViewCell *)aCell forItemAtIndexPath:(NSIndexPath *)aIndexPath
{
}


- (CGSize)collectionView:(UICollectionView *)aCollectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)aIndexPath
{
    return CGSizeZero;
}


@end
