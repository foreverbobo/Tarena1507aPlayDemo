//
//  HeroIconView.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/11.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroIconView.h"

@interface HeroIconView()
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation HeroIconView

-(instancetype)init
{
    if(self = [super init])
    {
        self.imageView = [UIImageView new];
        [self addSubview:self.imageView];
        self.imageView.contentMode = 2;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.clipsToBounds = YES;
    }
    return self;
    
}
-(void)setHeroName:(NSString *)heroName
{
    _heroName = heroName;
    NSString *path = [NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",heroName];
    [self.imageView setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
}
@end
