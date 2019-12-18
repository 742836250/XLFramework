//
//  XLTouchIDVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/26.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLTouchIDVC.h"
#import "XLTouchID.h"

@interface XLTouchIDVC ()

@end

@implementation XLTouchIDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [XLTouchID touchIDVerificationCompleteBlock:^(BOOL success, NSString * _Nonnull msg) {
        
        NSLog(@"msg:%@",msg);
        
    }];
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
