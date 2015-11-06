//
//  TuWanListViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/6.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanImageCell.h"
#import "TuWanWebView.h"
@interface TuWanListViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong)TuWanViewModel *tuwanVM;
@end

@implementation TuWanListViewController
{
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLB;
    NSTimer *_timer;
}
#pragma mark -- 头部滚动视图
-(UIView *)headerView
{
    [_timer invalidate];
    //如果当前没有头部视图
    if(!self.tuwanVM.isExistIndexPic)
    {
        return nil;
    }
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 250)];
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
   // bottomView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [headerView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLB = [UILabel new];
    [bottomView addSubview:_titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuwanVM.indexPicArr.count;
    //如果就一张图 pageconreol不显示
    _pageControl.hidesForSinglePage = YES;
    _pageControl.userInteractionEnabled = NO;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLB.mas_right).mas_equalTo(-10);
    }];
    _titleLB.text = [self.tuwanVM titleForRowInIndexPic:0];
    _ic = [iCarousel new];
    [headerView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    _ic.scrollEnabled = self.tuwanVM.indexPicArr.count > 1?YES:NO;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    
    if(self.tuwanVM.indexPicArr.count > 1)
    {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    
    return headerView;
}
#pragma mark -- IC Delegate
-(NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.tuwanVM.indexPicArr.count;
}
-(UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if(!view)
    {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 250 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    
    }
    UIImageView *imageView = [(UIImageView *)view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM headerImageUrlWithRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if(option == iCarouselOptionWrap)
    {
        return YES;
    }
    return value;
}
-(void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    NSInteger index = carousel.currentItemIndex;
    dispatch_async(dispatch_get_main_queue(), ^{
        _titleLB.text = [self.tuwanVM titleForRowInIndexPic:index];
        _pageControl.currentPage = index;
    });
}
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if([self.tuwanVM isHtmlInIndexPicForRow:index])
    {
        NSURL *url = [self.tuwanVM htmlURLForRowInIndexPic:index];
        TuWanWebView *webview = [[TuWanWebView alloc]initWithURL:url];
        [self.navigationController pushViewController:webview animated:YES];
    }
    
}

-(instancetype)initWithType:(TuWanListType)type
{
    if(self = [super init])
    {
        _type = type;
    }
    return self;
}
-(TuWanViewModel *)tuwanVM
{
    if(!_tuwanVM)
    {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_type];
    }
    return _tuwanVM;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.tableView.tableHeaderView = [self headerView];
                [self.tableView reloadData];
            });
        }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.tableView.tableHeaderView = [self headerView];
                [self.tableView reloadData];
            });
        }];
    }];
    
    
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.tuwanVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if([self.tuwanVM containImages:indexPath.row])
    {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [NSString stringWithFormat:@"%@浏览",[self.tuwanVM clicksForRowInList:indexPath.row]];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM indexPicURLInArrarWithIndex:0 WithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM indexPicURLInArrarWithIndex:1 WithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM indexPicURLInArrarWithIndex:2 WithRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell;
        
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell"];
    cell.titleLB.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLB.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksLB.text = [NSString stringWithFormat:@"%@浏览",[self.tuwanVM clicksForRowInList:indexPath.row]];
    [cell.iconView.imageView setImageWithURL:[self.tuwanVM iconUrlForRowInList:indexPath.row]placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
   
    return cell;
}
kRemoveCellSeparator
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if([self.tuwanVM containImages:indexPath.row])
//    {
//        return 135;
//    }
//    return 90;
    return [self.tuwanVM containImages:indexPath.row]?135:90;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if([self.tuwanVM isHtmlInListForRow:indexPath.row])
    {
        NSURL *url = [self.tuwanVM htmlURLForRowInList:indexPath.row];
        TuWanWebView *webview = [[TuWanWebView alloc]initWithURL:url];
        [self.navigationController pushViewController:webview animated:YES];
    }
    
    
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
