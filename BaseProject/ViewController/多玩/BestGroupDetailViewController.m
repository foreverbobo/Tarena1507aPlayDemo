//
//  BestGroupDetailViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BestGroupDetailViewController.h"
#import "HeroIconView.h"
#import "BestGoupCellCell.h"
@interface BestGroupDetailCell:UITableViewCell
@property (nonatomic,strong)HeroIconView *iconView;
@property (nonatomic,strong)UILabel *descLb;
@end
@implementation BestGroupDetailCell
-(HeroIconView *)iconView
{
    if(!_iconView)
    {
        _iconView = [HeroIconView new];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
    }
    return _iconView;
}
-(UILabel *)descLb
{
    if(!_descLb)
    {
        _descLb = [UILabel new];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconView.mas_topMargin);
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(-10);
        }];
        _descLb.numberOfLines = 0;
    }
    return _descLb;

}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    
    }
    return self;
}

@end

@interface BestGroupDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation BestGroupDetailViewController
- (id)initWithTitle:(NSString *)title desc:(NSString *)desc nameArray:(NSArray *)nameArray decs:(NSArray *)descs{
    if (self = [super init]) {
        self.title0 = title;
        self.desc = desc;
        self.nameArray = nameArray;
        self.descs = descs;
    }
    return self;
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
        _tableView.allowsSelection = NO;
        [_tableView registerClass:[BestGoupCellCell class] forCellReuseIdentifier:@"Cell1"];
        [_tableView registerClass:[BestGroupDetailCell class] forCellReuseIdentifier:@"Cell2"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView reloadData];
    self.title = @"阵容详情";
    [FactoryClass addReturnItemToVC:self];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 1;
    }
    else
    {
        return self.nameArray.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        BestGoupCellCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
        cell.titleLb.text = _title0;
        cell.hero1.heroName = self.nameArray[0];
        cell.hero2.heroName = self.nameArray[1];
        cell.hero3.heroName = self.nameArray[2];
        cell.hero4.heroName = self.nameArray[3];
        cell.hero5.heroName = self.nameArray[4];
        cell.descLB.text = self.desc;
        cell.descLB.numberOfLines = 0;
        return cell;
    }
    else
    {
        BestGroupDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        cell.descLb.text = self.descs[indexPath.row];
        cell.iconView.heroName = self.nameArray[indexPath.row];
        return cell;
        
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}




@end
