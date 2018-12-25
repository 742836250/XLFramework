//
//  ViewController.m
//  XLFramework
//
//  Created by Jack Wang on 2018/9/12.
//  Copyright © 2018年 Jack Wang. All rights reserved.
//

#import "XLViewController.h"
#import "XLVCTBCell.h"

@interface XLViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTabView;

@property (nonatomic, strong,readwrite) NSArray *dataArr;

@end

@implementation XLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mainTabView registerNib:[UINib nibWithNibName:@"XLVCTBCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}

- (XLVCTBCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLVCTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    NSDictionary *dic = self.dataArr[indexPath.row];
    cell.contentLab.text = dic[@"cellContent"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.dataArr[indexPath.row];
    
    Class VCClass = [NSClassFromString(dic[@"vcClassName"]) class];
    UIViewController *vc = (UIViewController *)[VCClass new];
    if (![vc respondsToSelector:@selector(useLayoutToLayoutNavigationTransitions)])
    {
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81.0f;
}


- (NSArray *)dataArr
{
    if (!_dataArr)
    {
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"VCClassName" ofType:@"plist"];
        _dataArr =  [NSArray arrayWithContentsOfFile:fileName];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
