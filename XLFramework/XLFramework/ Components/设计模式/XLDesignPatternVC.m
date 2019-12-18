//
//  XLDesignPatternVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/12/28.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLDesignPatternVC.h"

@interface XLDesignPatternVC ()

@end

@implementation XLDesignPatternVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设计模式";
    [self initLocalData];
    
}

- (void)initLocalData
{
    NSString *fileName = [[NSBundle mainBundle] pathForResource:@"DesignPattern" ofType:@"plist"];
    self.xl_dataArr = [NSMutableArray arrayWithContentsOfFile:fileName];
    [self.xl_mainTabView reloadData];
}


@end
