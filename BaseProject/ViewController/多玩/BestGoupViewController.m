//
//  BestGoupViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BestGoupViewController.h"
#import "BestGoupCellCell.h"
#import "DuoWanBestGoupViewModel.h"
#import "BestGroupDetailViewController.h"
@interface BestGoupViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)DuoWanBestGoupViewModel *bestVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation BestGoupViewController
-(DuoWanBestGoupViewModel *)bestVM
{
    if(!_bestVM)
    {
        _bestVM = [DuoWanBestGoupViewModel new];
    }
    return _bestVM;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[BestGoupCellCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.bestVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
    self.title = @"最佳阵容";
    [FactoryClass addReturnItemToVC:self];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bestVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BestGoupCellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.bestVM titleForRow:indexPath.row];
    cell.hero1.heroName = [self.bestVM heroNamesForRow:indexPath.row][0];
    cell.hero2.heroName = [self.bestVM heroNamesForRow:indexPath.row][1];
    cell.hero3.heroName = [self.bestVM heroNamesForRow:indexPath.row][2];
    cell.hero4.heroName = [self.bestVM heroNamesForRow:indexPath.row][3];
    cell.hero5.heroName = [self.bestVM heroNamesForRow:indexPath.row][4];
    cell.descLB.text = [self.bestVM descForRow:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BestGroupDetailViewController *vc = [[BestGroupDetailViewController alloc]initWithTitle:[self.bestVM titleForRow:indexPath.row] desc:[self.bestVM descForRow:indexPath.row] nameArray:[self.bestVM heroNamesForRow:indexPath.row] decs:[self.bestVM heroDescForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}




@end
