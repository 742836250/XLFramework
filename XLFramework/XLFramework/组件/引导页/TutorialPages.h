//
//  TutorialPages.h
//  引导页
//
//  Created by 王锐锋 on 15/12/21.
//  Copyright © 2015年 王锐锋. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^DismissCallBack)(BOOL firstShow);

@interface TutorialPages : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

+ (void)canShowInView:(UIView *)aView
                items:(NSMutableArray *)aItems
      dismissCallBack:(DismissCallBack)aDismissBlock;

+ (BOOL)showTutorialPages;


@end

@interface TutorialPagesCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *pageImageView;

@property (nonatomic, strong) UIButton *skipBtn;

@property (nonatomic, strong) void(^skipBtnClickBlock)(void);



- (id)initWithFrame:(CGRect)frame;

@end
