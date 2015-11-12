//
//  PlayView.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/10.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "PlayView.h"

@implementation PlayView
-(UIButton *)playBtn
{
    if(!_playBtn)
    {
        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"btn_record_start"] forState:UIControlStateNormal];
        [_playBtn setBackgroundImage:[UIImage imageNamed:@"btn_record_pause"] forState:UIControlStateSelected];
        [self addSubview:_playBtn];
        [_playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_playBtn bk_addEventHandler:^(UIButton *sender) {
            if(sender.selected)
            {
                [_player pause];
            }
            else
            {
                [_player play];
            }
            sender.selected = !sender.selected;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _playBtn;
}
+(PlayView *)sharedInsstence
{
    static PlayView *p = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        p = [[PlayView alloc]init];
    });
    return p;
}
-(instancetype)init
{
    if(self = [super init])
    {
        self.playBtn.hidden = NO;
    }
    return self;
}
-(void)playWithUrl:(NSURL *)musicUrl
{
    [[AVAudioSession sharedInstance]setCategory:AVAudioSessionCategoryPlayback error:nil];
    [[AVAudioSession sharedInstance]setActive:YES error:nil];
    self.player = [AVPlayer playerWithURL:musicUrl];
    [self.player play];
    self.playBtn.selected = YES;
}


@end
