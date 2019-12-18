//
//  XLWebViewBaseVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/12/25.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLWebViewBaseVC.h"
#import "XLWebViewPresenter.h"

@interface XLWebViewBaseVC ()

@property (nonatomic, strong) XLWebViewPresenter *xl_Presenter;

@end

@implementation XLWebViewBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.xl_Presenter setView:self.view];
    [self.xl_Presenter setViewController:self];
    [self.xl_Presenter presentWithModel:self.xl_url viewController:self];
}
#pragma mark - getter

- (XLWebViewPresenter *)xl_Presenter
{
    if (!_xl_Presenter)
    {
        _xl_Presenter = [[XLWebViewPresenter alloc] init];
    }
    return _xl_Presenter;
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",[self class]);
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
