//
//  ZBListViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "ZBListViewController.h"
#import "ZBListViewModel.h"
#import "ZBTagCollectionViewController.h"
#import "EquipCollectionLayout.h"
@interface ZBListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)ZBListViewModel *zbVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ZBListViewController
-(ZBListViewModel *)zbVM
{
    if(!_zbVM)
    {
        _zbVM = [ZBListViewModel new];
    }
    return _zbVM;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.tableFooterView = [UIView new];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
    self.title = @"装备列表";
    [FactoryClass addReturnItemToVC:self];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.zbVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.zbVM titleForRow:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    EquipCollectionLayout *layout = [EquipCollectionLayout new];
    ZBTagCollectionViewController *vc = [[ZBTagCollectionViewController alloc]initWithCollectionViewLayout:layout];
    vc.tag = [self.zbVM tagForRow:indexPath.row];
    vc.hidesBottomBarWhenPushed = YES;
    vc.title = [self.zbVM titleForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
