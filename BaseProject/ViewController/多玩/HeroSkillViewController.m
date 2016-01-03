//
//  HeroSkillViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroSkillViewController.h"
#import "HeroSkillViewModel.h"
#import "HeroIconView.h"
@class HeroSkillViewCell;
@protocol HeroSkillViewCellDelegate <NSObject>
@optional
-(void)HeroSkillViewCell:(HeroSkillViewCell *)cell completeWithIndex:(NSInteger)Index;

@end
@interface HeroSkillViewCell : UITableViewCell<HeroSkillViewCellDelegate>
@property (nonatomic,strong)NSArray *skillArray;
@property (nonatomic,weak)UIView *whiteView;
@property (nonatomic,weak)id<HeroSkillViewCellDelegate>delegate;
@end
@implementation HeroSkillViewCell
-(void)setSkillArray:(NSArray *)skillArray
{
    _skillArray = skillArray;
    NSInteger count = skillArray.count;
    if(count > 0)
    {
        UIButton *lastButton = nil;
        for (int i = 0; i < count; i++) {
            NSInteger index = i;
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_64x64.png?v=10&OSType=iOS7.0.3",skillArray[i]];
            [button setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:path]];
            [self.whiteView addSubview:button];
            if(lastButton == nil)
            {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.mas_equalTo(5);
                    make.size.mas_equalTo(CGSizeMake(50, 50));
                }];
            }
            else
            {
                if(i%5 == 0)
                {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.size.mas_equalTo(lastButton);
                        make.left.mas_equalTo(5);
                        make.topMargin.mas_equalTo(lastButton.mas_bottom).mas_equalTo(10);
                    }];
                }
                else
                {
                    [button mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.size.mas_equalTo(lastButton);
                        make.centerY.mas_equalTo(lastButton);
                        make.left.mas_equalTo(lastButton.mas_right).mas_equalTo(10);
                    }];
                }
                
            }
            if(i == count - 1)
            {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.mas_equalTo(-10);
                }];
            }
            [button bk_addEventHandler:^(id sender) {
                if([self.delegate respondsToSelector:@selector(HeroSkillViewCell:completeWithIndex:)])
                {
                    [self.delegate HeroSkillViewCell:self completeWithIndex:index];
                    
                }
                
            } forControlEvents:UIControlEventTouchUpInside];
            lastButton = button;
        }
        
    }


}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
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
        self.whiteView = whiteView;
        
    }
    return self;

}
@end

@interface HeroSkillDescCell : UITableViewCell
@property (nonatomic,strong)UILabel *nameLB;
@property (nonatomic,strong)UILabel *descLb;
@property (nonatomic,strong)UILabel *costLb;
@property (nonatomic,strong)UILabel *cooldownLb;
@property (nonatomic,strong)UILabel *range;
@property (nonatomic,strong)UILabel *effect;
@end
@implementation HeroSkillDescCell
-(UILabel *)nameLB
{
    if(!_nameLB)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(10);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"名字";
        _nameLB = [UILabel new];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
        }];
        _nameLB.numberOfLines = 0;
        _nameLB.font = [UIFont systemFontOfSize:15];
    }
    return _nameLB;
    
}
-(UILabel *)descLb
{
    if(!_descLb)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.nameLB.mas_bottomMargin).mas_equalTo(20);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"描述";
        _descLb = [UILabel new];
        [self.contentView addSubview:_descLb];
        [_descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
        }];
        _descLb.numberOfLines = 0;
        _descLb.font = [UIFont systemFontOfSize:15];
    }
    return _descLb;
}
-(UILabel *)costLb
{
    if(!_costLb)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.descLb.mas_bottomMargin).mas_equalTo(20);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"消耗";
        _costLb = [UILabel new];
        [self.contentView addSubview:_costLb];
        [_costLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
        }];
        _costLb.numberOfLines = 0;
        _costLb.font = [UIFont systemFontOfSize:15];
    }
    return _costLb;
}
-(UILabel *)cooldownLb
{
    if(!_cooldownLb)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.costLb.mas_bottomMargin).mas_equalTo(20);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"冷却";
        _cooldownLb = [UILabel new];
        [self.contentView addSubview:_cooldownLb];
        [_cooldownLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
        }];
        _cooldownLb.numberOfLines = 0;
        _cooldownLb.font = [UIFont systemFontOfSize:15];
    }
    
    return _cooldownLb;

}
-(UILabel *)range
{
    if(!_range)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.cooldownLb.mas_bottomMargin).mas_equalTo(20);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"范围";
        _range = [UILabel new];
        [self.contentView addSubview:_range];
        [_range mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
        }];
        _range.numberOfLines = 0;
        _range.font = [UIFont systemFontOfSize:15];
    }
    return _range;
}
-(UILabel *)effect
{
    if(!_effect)
    {
        UILabel *lb = [UILabel new];
        [self.contentView addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(32, 18));
            make.left.mas_equalTo(10);
            make.topMargin.mas_equalTo(self.range.mas_bottomMargin).mas_equalTo(20);
        }];
        lb.font = [UIFont systemFontOfSize:13];
        lb.textColor = [UIColor lightGrayColor];
        lb.text = @"影响";
        _effect = [UILabel new];
        [self.contentView addSubview:_effect];
        [_effect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lb.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(lb.mas_topMargin).mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
        }];
        _effect.numberOfLines = 0;
        _effect.font = [UIFont systemFontOfSize:15];
    }
    return _effect;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
    
    }
    return self;

}
@end


@interface HeroSkillViewController ()<UITableViewDelegate,UITableViewDataSource,HeroSkillViewCellDelegate>
@property (nonatomic,strong)HeroSkillViewModel *skillVM;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,assign)NSInteger index;
@end

@implementation HeroSkillViewController
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
            [self.skillVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_tableView reloadData];
                self.index = 0;
                [_tableView.mj_header endRefreshing];
            }];
        }];
        [_tableView registerClass:[HeroSkillViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[HeroSkillDescCell class] forCellReuseIdentifier:@"desc"];
        _tableView.allowsSelection = NO;
    }
    return _tableView;

}
-(HeroSkillViewModel *)skillVM
{
    if(!_skillVM)
    {
        _skillVM = [[HeroSkillViewModel alloc]initWithHeroName:self.heroName];
    }
    return _skillVM;
}
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
-(void)setIndex:(NSInteger)index
{
    _index = index;
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.index = -1;
    [self.tableView.mj_header beginRefreshing];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @[@"技能说明",@"喜欢组合",@"憎恨组合"][section];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
    {
        return 2;
    }
    else if (section == 1)
    {
        return self.skillVM.likeHeroArray.count;
    }
    else
    {
        return self.skillVM.hateHeroArray.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0)
        {
            HeroSkillViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
            cell.skillArray = [self.skillVM skillNameArray];
            cell.delegate = self;
            return cell;
        }
        else
        {
            if(self.index >= 0)
            {
                HeroSkillDescCell *cell = [tableView dequeueReusableCellWithIdentifier:@"desc"];
                cell.nameLB.text = [self.skillVM nameForIndex:self.index];
                cell.descLb.text = [self.skillVM descForIndex:self.index];
                cell.costLb.text = [self.skillVM costForIndex:self.index];
                cell.cooldownLb.text = [self.skillVM cooldownForIndex:self.index];
                cell.range.text = [self.skillVM rangeForIndex:self.index];
                cell.effect.text = [self.skillVM effectForIndex:self.index];
                return cell;
                
            }
            
        }
    }else if(indexPath.section == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell2"];
        }
        HeroIconView *icon = [HeroIconView new];
        [cell.contentView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.top.left.mas_equalTo(10);
        }];
        icon.heroName = [self.skillVM likeNameForRow:indexPath.row];
        [cell.textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(icon.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = [self.skillVM likeDescForRow:indexPath.row];
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3"];
        if(cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell3"];
        }
        HeroIconView *icon = [HeroIconView new];
        [cell.contentView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.top.left.mas_equalTo(10);
        }];
        icon.heroName = [self.skillVM hateNameForRow:indexPath.row];
        [cell.textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(icon.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.height.mas_greaterThanOrEqualTo(50);
            make.bottom.mas_equalTo(-10);
        }];
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.text = [self.skillVM hateDescForRow:indexPath.row];
        return cell;
    }
    

    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell1"];
    }

    return cell;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
-(void)HeroSkillViewCell:(HeroSkillViewCell *)cell completeWithIndex:(NSInteger)Index
{
    self.index = Index;
}


@end
