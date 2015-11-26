//
//  EquipCollectionLayout.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "EquipCollectionLayout.h"

@implementation EquipCollectionLayout
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        //配置参数 由于继承flowLayout 所以才有以下属性  如果继承UICollectionViewLayout 则没有如下属性
        self.itemSize = CGSizeMake(80, 90);
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        //分区间的内边距
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        // 滚动方向
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
    }
    return self;
    
}
@end
