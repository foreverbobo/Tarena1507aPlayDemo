//
//  LeftViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "LeftViewController.h"
#import <NSString+Icons.h>
#import "TuWanViewController.h"
#import "DuoWanViewController.h"
#import "XiMaViewController.h"
@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *itemsNames;
@end

@implementation LeftViewController
-(NSArray *)itemsNames
{
    return @[@"资讯速递",@"阿西吧电台",@"LOL资讯",@"个人设置"];
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(kWindowW*0.5, kWindowH*0.5));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsNames.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.itemsNames[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[TuWanViewController standardTuWanNavi] animated:YES];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[XiMaViewController defaultNavi] animated:YES];
            break;
        default:
            break;
    }
    [self.sideMenuViewController hideMenuViewController];
}



@end
