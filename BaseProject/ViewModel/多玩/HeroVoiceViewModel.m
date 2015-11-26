//
//  HeroVoiceViewModel.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroVoiceViewModel.h"

@implementation HeroVoiceViewModel
-(instancetype)initWithHeroName:(NSString *)heroName
{
    if(self = [super init])
    {
        self.heroName = heroName;
    }
    return self;
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    if(self.dataArr.count > 0)
    {
        return;
    }
    self.dataTask = [DuoWanNetManager getDataWithType:DuoWanHeroListVoiceArray Hero:self.heroName completionHandle:^(id model, NSError *error) {
        [self.dataArr addObjectsFromArray:model];
        completionHandle(error);
    }];
    
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(NSString *)titleForRow:(NSInteger)row
{
    return  self.dataArr[row];

}
@end
