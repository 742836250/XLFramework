//
//  XLRootVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/9/12.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import "XLBaseVC.h"

@interface XLBaseVC ()

@end

@implementation XLBaseVC


/**
 设置状态栏的颜色

 @return UIStatusBarStyle
 */
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //系统导航返回按钮
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] init];
    backBtn.title = @"";
    self.navigationItem.backBarButtonItem = backBtn;
    //导航栏背景颜色
//    self.navigationController.navigationBar.barTintColor = RGBA(131.0f,255.0f,255.0f,0.1f);
    //返回按钮和文字的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //导航title的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    //设置导航栏为不是半透明状态 (这要self.view 从导航底部开始布局)
    self.navigationController.navigationBar.translucent = NO;
    //导航背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_back_image"] forBarMetrics:UIBarMetricsDefault];
    //tabBar背景图片
    //[self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabBar_back_image"]];
    //tabBar背景颜色
    [self.tabBarController.tabBar setBarTintColor:RGB(108.0f, 0.0f, 95.0f)];
    //设置颜色 不然push为黑色并且卡顿
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
