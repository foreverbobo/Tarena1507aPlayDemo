//
//  XiMaTracksCell.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/9.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaTracksCell.h"

@implementation XiMaTracksCell
- (WBImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[WBImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        _iconIV.layer.cornerRadius = 55/2;
        //添加播放标识
        UIImageView *playIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_iconIV addSubview:playIV];
        [playIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
    }
    return _iconIV;
}
//
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(self.timeLb.mas_left).mas_equalTo(-10);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}
//
- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_timeLb];
        _timeLb.font = [UIFont systemFontOfSize:12];
        _timeLb.textColor = [UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
           // make.width.mas_equalTo(50);
        }];
        _timeLb.textAlignment = NSTextAlignmentRight;
    }
    return _timeLb;
}
//
- (UILabel *)nickLb {
    if(_nickLb == nil) {
        _nickLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nickLb];
        _nickLb.font = [UIFont systemFontOfSize:15];
        _nickLb.textColor = [UIColor lightGrayColor];
        [_nickLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
    }
    return _nickLb;
}
//
- (UILabel *)playTimeLb {
    if(_playTimeLb == nil) {
        _playTimeLb = [[UILabel alloc] init];
        [self.contentView addSubview:_playTimeLb];
        UIImageView *imageIV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageIV];
        [imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35/2, 42/2));
            make.leftMargin.mas_equalTo(self.nickLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.nickLb.mas_bottom).mas_equalTo(8);
        }];
        [_playTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageIV);
            make.left.mas_equalTo(imageIV.mas_right).mas_equalTo(3);
          //  make.width.mas_equalTo(40);
        }];
        _playTimeLb.font = [UIFont systemFontOfSize:12];
        _playTimeLb.textColor = [UIColor lightGrayColor];
    }
    return _playTimeLb;
}

- (UILabel *)likesLb {
    if(_likesLb == nil) {
        _likesLb = [[UILabel alloc] init];
        [self.contentView addSubview:_likesLb];
        UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playTimeLb);
            make.left.mas_equalTo(self.playTimeLb.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(35/2, 42/2));
        }];
        _likesLb.font = [UIFont systemFontOfSize:12];
        _likesLb.textColor = [UIColor lightGrayColor];
        [_likesLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(iv);
            make.left.mas_equalTo(iv.mas_right).mas_equalTo(3);
           // make.width.mas_equalTo(30);
        }];
    }
    return _likesLb;
}
//
- (UILabel *)commentLb {
    if(_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        [self.contentView addSubview:_commentLb];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.mas_equalTo(self.likesLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.likesLb);
        }];
        [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
           // make.width.mas_equalTo(30);
        }];
        _commentLb.font = [UIFont systemFontOfSize:12];
        _commentLb.textColor = [UIColor lightGrayColor];
    }
    return _commentLb;
}
//
- (UILabel *)durationLb {
    if(_durationLb == nil) {
        _durationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_durationLb];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_duration"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.mas_equalTo(self.commentLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.commentLb);
        }];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageView);
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.width.mas_equalTo(40);
        }];
        _durationLb.font = [UIFont systemFontOfSize:12];
        _durationLb.textColor = [UIColor lightGrayColor];
    }
    return _durationLb;
}

- (UIButton *)downLoadBtn {
    if(_downLoadBtn == nil) {
        _downLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downLoadBtn setImage:[UIImage imageNamed:@"cell_download"] forState:UIControlStateNormal];
        [_downLoadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"下载点击按钮。。。。");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downLoadBtn];
        [_downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.durationLb);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(45, 45));
        }];
    }
    return _downLoadBtn;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.downLoadBtn.hidden = NO;
        //设置cell被选中后的背景色
        UIView *view = [UIView new];
        view.backgroundColor = kRGBColor(243, 255, 254);
        self.selectedBackgroundView = view;
        self.separatorInset = UIEdgeInsetsMake(0, 70, 0, 0);
    }
    return self;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
