//
//  XiMaViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "XiMaViewController.h"
#import "XiMaViewModel.h"
#import "XiMaCategoryCell.h"
@interface XiMaViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)XiMaViewModel *ximaVM;
@end

@implementation XiMaViewController
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[XiMaCategoryCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(XiMaViewModel *)ximaVM
{
    if(!_ximaVM)
    {
        _ximaVM = [[XiMaViewModel alloc]init];
    }
    return _ximaVM;
}
+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        XiMaViewController *vc = [XiMaViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
    });
    return navi;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [FactoryClass addMenuItemToVC:self];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.ximaVM refreshDataCompletionHandle:^(NSError *error) {
            if(error)
            {
                [self showErrorMsg:error.localizedDescription];
                
            }
            else
            {
                [self.tableView reloadData];
            }
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        [self.ximaVM getMoreDataCompletionHandle:^(NSError *error) {
            if(error)
            {
               // [self showErrorMsg:error];
                if(error.code == 999)
                {
                    [self.tableView.mj_footer endRefreshingWithNoMoreData];
                }
            }
            else
            {
                [self.tableView reloadData];
            }
            [self.tableView.mj_footer resetNoMoreData];
            [self.tableView.mj_footer endRefreshing];
        }];
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ximaVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XiMaCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.orderLB.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.titleLB.text = [self.ximaVM titleForRow:indexPath.row];
    cell.descLB.text = [self.ximaVM descForRow:indexPath.row];
    cell.numberLB.text = [self.ximaVM numberForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.ximaVM iconURLForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_7"]];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170/2.0;
}

@end
