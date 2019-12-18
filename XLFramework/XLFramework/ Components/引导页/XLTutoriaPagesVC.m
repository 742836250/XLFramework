//
//  JKStartMapTutoriaPagesVC.m
//  Gamebox7724
//
//  Created by Jack Wang on 2018/6/19.
//  Copyright © 2018年 pipaw. All rights reserved.
//

#import "XLTutoriaPagesVC.h"
#import "TutorialPages.h"
#import "AppDelegate.h"

@interface XLTutoriaPagesVC ()

@end

@implementation XLTutoriaPagesVC
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *imageArray = [NSMutableArray arrayWithObjects:@"tutorialPages_noPagecontrol_0",@"tutorialPages_noPagecontrol_1",@"tutorialPages_noPagecontrol_2",nil];
    [TutorialPages canShowInView:self.view items:imageArray dismissCallBack:^(BOOL firstShow){
    }];
}

@end
