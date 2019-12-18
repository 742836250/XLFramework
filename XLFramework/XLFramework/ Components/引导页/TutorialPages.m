//
//  TutorialPages.m
//  引导页
//
//  Created by 王锐锋 on 15/12/21.
//  Copyright © 2015年 王锐锋. All rights reserved.
//

#import "TutorialPages.h"

@interface CustomPageControl:UIPageControl
@end

@implementation CustomPageControl
- (void) setCurrentPage:(NSInteger)page
{
    
    [super setCurrentPage:page];
    
    for (NSUInteger subviewIndex = 0; subviewIndex < [self.subviews count]; subviewIndex++)
    {
        
        UIImageView* subview = [self.subviews objectAtIndex:subviewIndex];
        
        CGSize size;
        
        size.height = 10;
        
        size.width = 10;
        subview.layer.cornerRadius = 10/2;
        
        [subview setFrame:CGRectMake(subview.frame.origin.x, subview.frame.origin.y,
                                     
                                     size.width,size.height)];
    }
    
}
@end

@interface TutorialPages ()

@property (nonatomic, strong) UIView *tutorialPagesSuperView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray *items;

@property (nonatomic, strong) DismissCallBack dismissBlock;




@end

static NSString *cellIdentifier = @"tutorialPagesCell";
static NSString *everWorking = @"everWorking";
#define pageControl_tag 110
#define skipBtn_height 43
#define pageControl_height 50


@implementation TutorialPages

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        [self registerClass:[TutorialPagesCell class] forCellWithReuseIdentifier:cellIdentifier];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}
+ (void)canShowInView:(UIView *)aView
                items:(NSMutableArray *)aItems
      dismissCallBack:(DismissCallBack)aDismissBlock
{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:everWorking])
    {
        if (aDismissBlock)
        {
            aDismissBlock (NO);
        }
        return;
    }
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    TutorialPages *pagesCollectionView = [[TutorialPages alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    pagesCollectionView.backgroundColor = [UIColor whiteColor];
    pagesCollectionView.showsHorizontalScrollIndicator = NO;
    pagesCollectionView.pagingEnabled = YES;
    pagesCollectionView.bounces = NO;
    pagesCollectionView.tutorialPagesSuperView = aView;
    pagesCollectionView.dismissBlock = aDismissBlock;
    if (aItems&&aItems.count>0)
    {
        pagesCollectionView.items = aItems;
    }
    [aView addSubview:pagesCollectionView];
    
    CustomPageControl *pageControl = [[CustomPageControl alloc] init];
//    pageControl.backgroundColor = [UIColor blackColor];
    pageControl.numberOfPages = aItems.count;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = RGBA(233.0f, 233.0f, 233.0f, 1.0f);
    pageControl.currentPageIndicatorTintColor = RGBA(1.0f, 179.0f, 254.0f, 1.0f);
    pageControl.tag = pageControl_tag;
    pageControl.enabled = NO;
    [aView addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(aView);
        make.top.mas_equalTo(aView.mas_bottom).offset(-pageControl_height);
    }];
}
#pragma mark collectionViewMethod
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TutorialPagesCell *cell = (TutorialPagesCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    NSString *imageName = [self.items objectAtIndex:indexPath.row];
    cell.pageImageView.image = [UIImage imageNamed:imageName];
    //最后一个可见
    if (indexPath.row == self.items.count-1)
    {
        cell.skipBtn.hidden = NO;
    }
    else
    {
        cell.skipBtn.hidden = YES;
    }
    cell.skipBtnClickBlock = ^{
        [self dismiss];
    };
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.tutorialPagesSuperView.frame), CGRectGetHeight(self.tutorialPagesSuperView.frame));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //最后一个相应事件
//    if (indexPath.row == self.items.count-1)
//    {
//        [self dismiss];
//    }
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CustomPageControl *pageControl = [self.superview viewWithTag:pageControl_tag];
    pageControl.currentPage = self.contentOffset.x/self.frame.size.width;
}
- (void)dismiss
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults  setBool:YES forKey:everWorking];
    [userDefaults synchronize];
    
    CustomPageControl *pageControl = [self.superview viewWithTag:pageControl_tag];
    [UIView animateWithDuration:0 animations:^{
        
        self.alpha = 0;
        pageControl.alpha = 0;
        
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self removeFromSuperview];
            [pageControl removeFromSuperview];
            
            if (self.dismissBlock)
            {
                self.dismissBlock (YES);
            }
        }
    }];

}
+ (BOOL)showTutorialPages
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:everWorking])
    {
        return NO;
    }
    else
    {
        return YES;
    }
}
/*
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat maxZoomLeft = 50;
    if (scrollView.contentOffset.x>CGRectGetWidth(self.frame)*(self.items.count-1) + maxZoomLeft)
    {
        [self dismiss];
    }

}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate

{
    if(!decelerate)
    {
       
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
    
{
    if (scrollView.contentOffset.x/CGRectGetWidth(self.frame)>0)
    {
        scrollView.bounces = YES;
    }
    else if (scrollView.contentOffset.x/CGRectGetWidth(self.frame) ==0)
    {
        scrollView.bounces = NO;
    }
    
    
}*/
- (void)dealloc
{
    NSLog(@"dealloc %@",[self class]);
}
@end

@implementation TutorialPagesCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.pageImageView = [[UIImageView alloc] init];
        self.pageImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.pageImageView.clipsToBounds = YES;
        self.skipBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.skipBtn.backgroundColor = RGBA(1.0f, 179.0f, 254.0f, 1.0f);
        [self.skipBtn setTitle:@"立即体验" forState:UIControlStateNormal];
        [self.skipBtn setTitle:@"立即体验" forState:UIControlStateHighlighted];
        [self.skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.skipBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        self.skipBtn.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        self.skipBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.skipBtn.layer.cornerRadius = skipBtn_height/2.0;
        self.skipBtn.hidden = YES;
        [self.skipBtn addTarget:self action:@selector(skipBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:self.pageImageView];
        [self.contentView addSubview:self.skipBtn];
        
    }
    return self;
}
- (void)skipBtnClick:(UIButton *)btn
{
    if (self.skipBtnClickBlock)
    {
        self.skipBtnClickBlock();
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pageImageView.frame = self.contentView.bounds;
    CGFloat skipBtn_left = 70;
    self.skipBtn.frame = CGRectMake(skipBtn_left, CGRectGetHeight(self.contentView.frame) - (skipBtn_height+pageControl_height), CGRectGetWidth(self.frame)-skipBtn_left*2, skipBtn_height);
}

@end
