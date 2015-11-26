//
//  BaiKeViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaiKeViewController.h"
#import "ToolMenuViewModel.h"
#import "BaiKeWebViewController.h"
#import "BestGoupViewController.h"
#import "ZBListViewController.h"
#import "SkillCollectionViewController.h"
#import "EquipCollectionLayout.h"
@interface ToolMenuCell : UITableViewCell
@property (nonatomic,strong)UIImageView *iconIV;
@property (nonatomic,strong)UILabel *titleLb;

@end
@implementation ToolMenuCell
-(UIImageView *)iconIV
{
    if(!_iconIV)
    {
        _iconIV = [UIImageView new];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            make.width.mas_equalTo(34);
        }];
    }
    return _iconIV;
}
-(UILabel *)titleLb
{
    if(!_titleLb)
    {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-10);
        }];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.titleLb.hidden = NO;
        self.separatorInset = UIEdgeInsetsMake(0, 50, 0, 0);
    }
    return self;
}

@end

@interface BaiKeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)ToolMenuViewModel *toolVM;
@end

@implementation BaiKeViewController
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
            [self.toolVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                [_tableView.mj_header endRefreshing];
            }];
        }];
        [_tableView registerClass:[ToolMenuCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
-(ToolMenuViewModel *)toolVM
{
    if(!_toolVM)
    {
        _toolVM = [ToolMenuViewModel new];
    }
    return _toolVM;
}
-(instancetype)init
{
    if(self = [super init])
    {
        self.title = @"游戏百科";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addMenuItemToVC:self];
    [self.tableView.mj_header beginRefreshing];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.toolVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToolMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.toolVM nameURLForRow:indexPath.row];
    [cell.iconIV setImageWithURL:[self.toolVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch ([self.toolVM typeForRow:indexPath.row]) {
    
        case ToolMenuTypeWeb: {
            if([self.toolVM urlForRow:indexPath.row])
            {
                BaiKeWebViewController *vc = [[BaiKeWebViewController alloc]initWithUrl:[self.toolVM urlForRow:indexPath.row]];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        }
        case ToolMenuTypeNative: {
            NSString *tag = [self.toolVM tagForRow:indexPath.row];
            if([tag isEqualToString:@"item"])
            {
                ZBListViewController *vc = [ZBListViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if([tag isEqualToString:@"gift"])
            {
                NSLog(@"222");
            }
            else if([tag isEqualToString:@"runnes"])
            {
                NSLog(@"3333");
            }
            else if([tag isEqualToString:@"best_group"])
            {
                BestGoupViewController *vc = [BestGoupViewController new];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            else if([tag isEqualToString:@"sum_ability"])
            {
                EquipCollectionLayout *layout = [EquipCollectionLayout new];
                SkillCollectionViewController *vc = [[SkillCollectionViewController alloc]initWithCollectionViewLayout:layout];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
            else
            {
                return;
            }
            
            break;
        }
        default: {
            break;
        }
    }

}


@end
