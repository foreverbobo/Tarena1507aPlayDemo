//
//  HeroEquipViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroEquipViewController.h"
#import "HeroEquipViewModel.h"
#import "HeroEquipCell.h"
@interface HeroEquipViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)HeroEquipViewModel *equipVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HeroEquipViewController
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
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.equipVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        [_tableView registerClass:[HeroEquipCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.allowsSelection = NO;
    }
    return _tableView;
    
}
-(HeroEquipViewModel *)equipVM
{
    if(!_equipVM)
    {
        _equipVM = [[HeroEquipViewModel alloc]initWithHeroName:self.heroName];
    }
    return _equipVM;
}
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView.mj_header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.equipVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroEquipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.equipVM titleForRow:indexPath.row];
    cell.authorLb.text = [self.equipVM authorForRow:indexPath.row];
    cell.combatLb.text = [NSString stringWithFormat:@"战力:%@",[self.equipVM combatForRow:indexPath.row]];
    cell.equipIdArr = [self.equipVM equipIdArrayForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


@end
