//
//  HeroDetailViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroDetailViewController.h"
#import "HeroIconView.h"
#import "HeroSkillViewController.h"
#import "HeroEquipViewController.h"
#import "PageViewController.h"
#import "HeroMediaViewController.h"
#import "BaiKeWebViewController.h"
#import "HeroVoiceViewController.h"
@interface HeroDetailViewController ()
@property (nonatomic,strong)UIView *headView;
@end

@implementation HeroDetailViewController
-(UIView *)headView
{
    if(!_headView)
    {
        _headView = [UIView new];
        _headView.backgroundColor = kRGBColor(245, 245, 245);
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.left.mas_equalTo(0);
            make.height.mas_equalTo(95);
        }];
        HeroIconView *icon = [[HeroIconView alloc]init];
        [_headView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(7);
        }];
        icon.heroName = self.heroInfoDic[@"enName"];
        
        
        UILabel *nameLb = [UILabel new];
        [_headView addSubview:nameLb];
        [nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(icon.mas_topMargin).mas_equalTo(8);
            make.left.mas_equalTo(icon.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(130, 17));
        }];
        nameLb.font = [UIFont systemFontOfSize:16];
        nameLb.text = self.heroInfoDic[@"cnName"];
        
        
        NSString *money = self.heroInfoDic[@"price"];
        NSArray *priceMoney = [money componentsSeparatedByString:@","];
        UILabel *priceLb = [UILabel new];
        [_headView addSubview:priceLb];
        [priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(nameLb);
            make.leftMargin.mas_equalTo(nameLb.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(nameLb.mas_bottom).mas_equalTo(10);
        }];
        priceLb.text = [NSString stringWithFormat:@"金%@  券%@",priceMoney[0],priceMoney[1]];
        priceLb.font = [UIFont systemFontOfSize:12];
        priceLb.textColor = kRGBColor(146, 146, 146);
        
        
        NSString *rating = self.heroInfoDic[@"rating"];
        NSArray *ratingArr = [rating componentsSeparatedByString:@","];
        UILabel *rateLb = [UILabel new];
        [_headView addSubview:rateLb];
        [rateLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(nameLb);
            make.leftMargin.mas_equalTo(nameLb.mas_leftMargin).mas_equalTo(0);
            make.top.mas_equalTo(priceLb.mas_bottom).mas_equalTo(7);
        }];
        rateLb.text = [NSString stringWithFormat:@"攻%@ 防%@ 法%@ 难度%@",ratingArr[0],ratingArr[1],ratingArr[2],ratingArr[3]];
        rateLb.font = [UIFont systemFontOfSize:12];
        rateLb.textColor = kRGBColor(146, 146, 146);
    }
    return _headView;
}
-(instancetype)initWithHeroInfoDic:(NSDictionary *)heroInfoDic
{
    if(self = [super init])
    {
        self.heroInfoDic = heroInfoDic;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [FactoryClass addReturnItemToVC:self];
 //   self.headView.hidden = NO;
    PageViewController *pageVC = [[PageViewController alloc]initWithControlArray:[self controllsArray] buttonNameArr:[self buttonNameArray] topHeight:30 selectImage:[UIImage imageNamed:@"bg_navigationBar_normal"] unSelectImage:[UIImage imageNamed:@"navigationbar_bg"]];
    [self addChildViewController:pageVC];
    [self.view addSubview:pageVC.view];
    [pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headView.mas_bottom).mas_equalTo(0);
        make.left.right.bottom.mas_equalTo(0);
    }];

    
}
-(NSArray *)controllsArray
{
    HeroSkillViewController *skillVC = [[HeroSkillViewController alloc]initWithHeroName:self.heroInfoDic[@"enName"]];
    HeroEquipViewController *equipVC = [[HeroEquipViewController alloc]initWithHeroName:self.heroInfoDic[@"enName"]];
    HeroMediaViewController *mediaVC = [[HeroMediaViewController alloc]initWithHeroName:self.heroInfoDic[@"enName"]];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/heroTop10PlayersNew.php?hero=%@",self.heroInfoDic[@"enName"]]];
    BaiKeWebViewController *webVC = [[BaiKeWebViewController alloc]initWithUrl:url];
    HeroVoiceViewController *voiceVC = [[HeroVoiceViewController alloc]initWithHeroName:self.heroInfoDic[@"enName"]];
    return @[skillVC,equipVC,mediaVC,webVC,voiceVC];
}
-(NSArray *)buttonNameArray
{
    return @[@"技能",@"出装",@"视频",@"排行",@"配音"];
}


@end
