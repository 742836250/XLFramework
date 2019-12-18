//
//  XLOnlyTextTableVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/9/18.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import "XLOnlyTextTableVC.h"
#import "XLOnlyTextCell.h"
#import "XLWebViewBaseVC.h"
#import "XLFactoryPatternVC.h"

@interface XLOnlyTextTableVC ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation XLOnlyTextTableVC

- (void)dealloc
{
    NSLog(@"%@ dealloc",[self class]);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpSubviews];
}

- (void)setUpSubviews
{
    [self.view addSubview:self.xl_mainTabView];
    [self.xl_mainTabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.xl_dataArr.count;
}

- (XLOnlyTextCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLOnlyTextCell *cell = [tableView dequeueReusableCellWithIdentifier:[XLOnlyTextCell xl_cellId] forIndexPath:indexPath];
    NSDictionary *dic = self.xl_dataArr[indexPath.row];
    cell.xl_textLab.text = [dic allKeys][0];
    WEAKSELF
    cell.xl_longPressGestureBlock = ^{
        
        [weakSelf showCancelAlertWithTitle:@"查看demeo" message:nil cancelButtonTitle:@"确定" cancel:^{
            [weakSelf.navigationController pushViewController:[[XLFactoryPatternVC alloc] init] animated:YES];
        }];
    };
    
    return cell;
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.xl_dataArr[indexPath.row];
    NSString *key = [dic allKeys][0];
    NSString *value = dic[key];
    
    XLWebViewBaseVC *vc = [[XLWebViewBaseVC alloc] init];
    vc.xl_url = [NSURL URLWithString:value];
    if (![vc respondsToSelector:@selector(useLayoutToLayoutNavigationTransitions)])
    {
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - getter
- (UITableView *)xl_mainTabView
{
    if (!_xl_mainTabView)
    {
        _xl_mainTabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _xl_mainTabView.tableFooterView = [[UIView alloc] init];
        _xl_mainTabView.delegate = self;
        _xl_mainTabView.dataSource = self;
        _xl_mainTabView.rowHeight = 64.0f;
        [_xl_mainTabView registerClass:[XLOnlyTextCell class] forCellReuseIdentifier:[XLOnlyTextCell xl_cellId]];
    }
    return _xl_mainTabView;
}


@end
