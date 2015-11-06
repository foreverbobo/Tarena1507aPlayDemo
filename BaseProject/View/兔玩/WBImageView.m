//
//  WBImageView.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "WBImageView.h"

@implementation WBImageView

-(instancetype)init
{
    if(self = [super init])
    {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        self.clipsToBounds = YES;
    }
    return self;

}

@end
