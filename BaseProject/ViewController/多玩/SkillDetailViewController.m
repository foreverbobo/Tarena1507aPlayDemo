//
//  SkillDetailViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "SkillDetailViewController.h"
#import "HeroIconView.h"

@interface SkillDetailCell : UITableViewCell
@property (nonatomic,strong)UILabel *descLb;
@end
@implementation SkillDetailCell
-(UILabel *)descLb
{
    if(!_descLb)
    {
        _descLb = [UILabel new];
        _descLb.font=[UIFont systemFontOfSize:14];
        //黑线方框背景，正常由美工提供。 如果没有美工 可以考虑使用灰色视图套白色视图，两者边缘差距1像素来解决
        UIView *grayView = [UIView new];
        grayView.backgroundColor=[UIColor lightGrayColor];
        [self.contentView addSubview:grayView];
        grayView.layer.cornerRadius = 4;
        [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(3, 10, 3, 10));
        }];
        
        UIView *whiteView =[UIView new];
        whiteView.backgroundColor = [UIColor whiteColor];
        [grayView addSubview:whiteView];
        whiteView.layer.cornerRadius = 4;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(1, 1, 1, 1));
            make.height.mas_greaterThanOrEqualTo(28);
        }];
        
        [whiteView addSubview:_descLb];
        _descLb.numberOfLines = 0;
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
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

@interface SkillDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)UIView *headViewInView;
@end

@implementation SkillDetailViewController
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.mas_equalTo(0);
            make.top.mas_equalTo(self.headViewInView.mas_bottom);
        }];
        //_tableView.tableHeaderView = [self headView];
        _tableView.tableFooterView = [UIView new];
        _tableView.allowsSelection = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[SkillDetailCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}
-(UIView *)headViewInView
{
    if(!_headViewInView)
    {
        _headViewInView = [self headView];
        [self.view addSubview:_headViewInView];
        [_headViewInView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(0);
            make.height.mas_equalTo(90);
        }];
    }
    return _headViewInView;
}
-(id)initWithDataDic:(NSDictionary *)dataDic
{
    if(self = [super init])
    {
        self.dataDic = dataDic;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    DDLogInfo(@"%@",self.dataDic);
    self.headViewInView.hidden = NO;
    [FactoryClass addReturnItemToVC:self];
    self.title = self.dataDic[@"name"];
    [self.tableView reloadData];
    
    
}
-(UIView *)headView
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 90)];
    headView.backgroundColor = [UIColor whiteColor];
    HeroIconView *icon = [HeroIconView new];
    [headView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 60));
        make.left.top.mas_equalTo(10);
    }];
    icon.skillId = self.dataDic[@"identify"];
    UILabel *nameLb = [UILabel new];
    [headView addSubview:nameLb];
    [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(icon.mas_topMargin);
        make.left.mas_equalTo(icon.mas_right).mas_equalTo(10);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    nameLb.text = self.dataDic[@"name"];
    UILabel *coolDownLb = [UILabel new];
    [headView addSubview:coolDownLb];
    [coolDownLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nameLb.mas_bottom).mas_equalTo(10);
        make.left.right.mas_equalTo(nameLb);
        make.height.mas_equalTo(15);
    }];
    coolDownLb.text = [NSString stringWithFormat:@"冷却时间:%@",self.dataDic[@"cooldown"]];
    coolDownLb.textColor = [UIColor lightGrayColor];
    coolDownLb.font = [UIFont systemFontOfSize:15];
    UILabel *levelLB = [UILabel new];
    [headView addSubview:levelLB];
    [levelLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(coolDownLb);
        make.left.right.mas_equalTo(coolDownLb);
        make.top.mas_equalTo(coolDownLb.mas_bottom).mas_equalTo(10);
    }];
    levelLB.text = [NSString stringWithFormat:@"需要等级:%@",self.dataDic[@"level"]];
    levelLB.textColor = [UIColor lightGrayColor];
    levelLB.font = [UIFont systemFontOfSize:15];
    return headView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SkillDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    switch (indexPath.section) {
        case 0:
            cell.descLb.text = self.dataDic[@"des"];
            break;
        case 1:
            cell.descLb.text = self.dataDic[@"strong"];
            break;
        case 2:
            cell.descLb.text = self.dataDic[@"tips"];
            break;
        default:
            break;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"描述",@"天赋强化",@"提示"][section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
@end
