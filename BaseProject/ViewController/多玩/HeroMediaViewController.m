//
//  HeroMediaViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroMediaViewController.h"
#import "HeroMediaCell.h"
#import "HeroMediaViewModel.h"
@interface HeroMediaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)HeroMediaViewModel *mediaVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HeroMediaViewController
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
            [self.mediaVM refreshDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        _tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
            [self.mediaVM getMoreDataCompletionHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_footer endRefreshing];
            }];
        }];
        [_tableView registerClass:[HeroMediaCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.allowsSelection = NO;
    }
    return _tableView;
    
}
-(HeroMediaViewModel *)mediaVM
{
    if(!_mediaVM)
    {
        _mediaVM = [[HeroMediaViewModel alloc]initWithHeroName:self.heroName];
    }
    return _mediaVM;
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
    return self.mediaVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroMediaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLB.text = [self.mediaVM titleForRow:indexPath.row];
    cell.timeLB.text = [self.mediaVM videoLengthForRow:indexPath.row];
    cell.updateLB.text = [self.mediaVM updateForRow:indexPath.row];
    [cell.imageV.imageView setImageWithURL:[self.mediaVM picUrlForRow:indexPath.row]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


@end
