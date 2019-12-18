//
//  XLFactoryPatternVC.m
//  XLFramework
//
//  Created by Jack Wang on 2018/11/9.
//  Copyright © 2018 Jack Wang. All rights reserved.
//

#import "XLFactoryPatternVC.h"
#import "XLFactoryPatternBaseCell.h"
#import "XLClassUtils.h"

@interface XLFactoryPatternModel : NSObject

@property (nonatomic, strong, readwrite) NSArray <NSString *>*cellClassArr;
@property (nonatomic, strong, readwrite) NSMutableArray <XLFactoryPatternConfigureModel *>*dataArr;

@end

@implementation XLFactoryPatternModel

#pragma mark - private
- (UIColor *)randomColor
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

- (NSString *)randomIdentifier
{
    NSInteger value = arc4random() % self.cellClassArr.count;
    NSString *identifier = self.cellClassArr[value];
    return identifier;
}

#pragma mark - getter
- (NSArray <NSString *>*)cellClassArr
{
    if (!_cellClassArr)
    {
        _cellClassArr = [XLClassUtils findAllSubclassStrWithBaseClass:[XLFactoryPatternBaseCell class]];
    }
    return _cellClassArr;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr = @[].mutableCopy;
        for (NSInteger i = 0; i<100; i++)
        {
            XLFactoryPatternConfigureModel *model = [[XLFactoryPatternConfigureModel alloc] init];
            model.backColor = [self randomColor];
            model.identifier = [self randomIdentifier];
            [_dataArr addObject:model];
        }
        
    }
    return _dataArr;
}


@end

@interface XLFactoryPatternVC ()

@property (weak, nonatomic) IBOutlet UITableView *mainTBView;

@property (nonatomic, strong, readwrite) XLFactoryPatternModel *patternModel;

@end

@implementation XLFactoryPatternVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.patternModel.cellClassArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [self.mainTBView registerClass:NSClassFromString(obj) forCellReuseIdentifier:obj];
        
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.patternModel.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XLFactoryPatternConfigureModel *model = [self.patternModel.dataArr objectAtIndex:indexPath.row];
    XLFactoryPatternBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.identifier forIndexPath:indexPath];
    [cell configureDataSource:model];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 81.0f;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - getter
- (XLFactoryPatternModel *)patternModel
{
    if (!_patternModel)
    {
        _patternModel = [[XLFactoryPatternModel alloc] init];
    }
    return _patternModel;
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


