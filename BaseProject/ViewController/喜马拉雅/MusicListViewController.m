//
//  MusicListViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/10.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "MusicListViewController.h"
#import "XiMaAlbumViewModel.h"
#import "XiMaTracksCell.h"
#import "PlayView.h"
@interface MusicListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)XiMaAlbumViewModel *ximaAlbumVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation MusicListViewController
-(XiMaAlbumViewModel *)ximaAlbumVM
{
    if(!_ximaAlbumVM)
    {
        _ximaAlbumVM = [[XiMaAlbumViewModel alloc]initWithAlbumID:_albumId];
    }
    return _ximaAlbumVM;
}
-(instancetype)initWithAlbumId:(NSInteger)albumId
{
    if(self = [super init])
    {
        self.albumId = albumId;
    }
    return self;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaTracksCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.ximaAlbumVM refreshDataCompletionHandle:^(NSError *error) {
                if(error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                    [_tableView reloadData];
                    [_tableView.mj_footer resetNoMoreData];
                }
                [_tableView.mj_header endRefreshing];
                
            }];
        }];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.ximaAlbumVM getMoreDataCompletionHandle:^(NSError *error) {
                if(error)
                {
                    [self showErrorMsg:error.localizedDescription];
                }
                else
                {
                    [_tableView reloadData];
                    if([self.ximaAlbumVM isHasMore])
                    {
                        [_tableView.mj_footer endRefreshing];
                    }
                    else
                    {
                        [_tableView.mj_footer endRefreshingWithNoMoreData];
                    }
                }
                
                
            }];
        }];
    }
    return _tableView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView.mj_header beginRefreshing];
    [FactoryClass addReturnItemToVC:self];
    //添加播放控制视图
    [self.view addSubview:[PlayView sharedInsstence]];
    [[PlayView sharedInsstence] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ximaAlbumVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaTracksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.titleLb.text = [self.ximaAlbumVM titleForRow:indexPath.row];
    cell.timeLb.text = [self.ximaAlbumVM updateForRow:indexPath.row];
    cell.nickLb.text = [self.ximaAlbumVM nickTitleForRow:indexPath.row];
    cell.playTimeLb.text = [self.ximaAlbumVM playtimesNumberForRow:indexPath.row];
    cell.likesLb.text = [self.ximaAlbumVM likeNumberForRow:indexPath.row];
    cell.commentLb.text = [self.ximaAlbumVM commentsForRow:indexPath.row];
    cell.durationLb.text = [self.ximaAlbumVM durationForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaAlbumVM iconUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[PlayView sharedInsstence]playWithUrl:[self.ximaAlbumVM videoUrlForRow:indexPath.row]];
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
@end
