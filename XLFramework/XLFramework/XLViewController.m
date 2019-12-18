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

@property (weak, nonatomic) IBOutlet UITableView *xl_mainTabView;

@property (nonatomic, strong,readwrite) NSArray *xl_dataArr;

@end

@implementation XLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.xl_mainTabView registerNib:[UINib nibWithNibName:@"XLVCTBCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.xl_dataArr.count;
}

- (XLVCTBCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLVCTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"forIndexPath:indexPath];
    NSDictionary *dic = self.xl_dataArr[indexPath.row];
    cell.contentLab.text = dic[@"cellContent"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64.0f;
//    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = self.xl_dataArr[indexPath.row];
    
    Class VCClass = [NSClassFromString(dic[@"vcClassName"]) class];
    UIViewController *vc = (UIViewController *)[VCClass new];
    if (![vc respondsToSelector:@selector(useLayoutToLayoutNavigationTransitions)])
    {
        return;
    }
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 81.0f;
//}


- (NSArray *)xl_dataArr
{
    if (!_xl_dataArr)
    {
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"VCClassName" ofType:@"plist"];
        _xl_dataArr =  [NSArray arrayWithContentsOfFile:fileName];
    }
    return _xl_dataArr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
