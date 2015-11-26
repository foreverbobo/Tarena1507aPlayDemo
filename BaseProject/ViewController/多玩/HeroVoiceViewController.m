//
//  HeroVoiceViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroVoiceViewController.h"
#import "HeroVoiceViewModel.h"
@interface HeroVoiceViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)HeroVoiceViewModel *voiceVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation HeroVoiceViewController
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
            [self.voiceVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.allowsSelection = NO;
    }
    return _tableView;
    
}
-(HeroVoiceViewModel *)voiceVM
{
    if(!_voiceVM)
    {
        _voiceVM = [[HeroVoiceViewModel alloc]initWithHeroName:self.heroName];
    }
    return _voiceVM;
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
    return self.voiceVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.voiceVM titleForRow:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.numberOfLines = 2;
    cell.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
