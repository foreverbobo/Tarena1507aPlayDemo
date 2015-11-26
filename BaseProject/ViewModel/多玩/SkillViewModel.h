//
//  SkillViewModel.h
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface SkillViewModel : BaseViewModel
/**
 "name": "卫戍部队",
 "id": "17",
 "level": "1",
 "cooldown": "210",
 "des": "对友军防御塔使用——回复速度和攻击速度大幅度提高,持续8秒.对敌方防御塔——攻击力降低80%,持续8秒。",
 "strong": "",
 "tips": "支持的游戏模式： 统治战场。"
 */

@property (nonatomic,assign)NSInteger rowNumber;
-(NSString *)nameForRow:(NSInteger)row;
-(NSString *)idForRow:(NSInteger)row;
-(NSString *)levelForRow:(NSInteger)row;
-(NSString *)cooldownForRow:(NSInteger)row;
-(NSString *)desForRow:(NSInteger)row;
-(NSString *)strongForRow:(NSInteger)row;
-(NSString *)tipsForRow:(NSInteger)row;
-(NSDictionary *)dataDicForRow:(NSInteger)row;

@end
