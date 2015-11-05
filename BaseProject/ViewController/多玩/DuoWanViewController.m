//
//  DuoWanViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "DuoWanViewController.h"
#import "DuoWanViewModel.h"
@interface DuoWanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)DuoWanViewModel *duowanVM;
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation DuoWanViewController
-(DuoWanViewModel *)duowanVM
{
    if(!_duowanVM)
    {
        _duowanVM = [[DuoWanViewModel alloc]initListWithType:DuoWanListFree];
    }
    return _duowanVM;
}
-(UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
       // [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return  _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [self.duowanVM getListDataWithCompletionHandle:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.duowanVM.rowNumber;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    DuoWanFreeHeroModel *model = self.duowanVM.dataArr[indexPath.row];
    cell.textLabel.text = model.cnName;

    [cell.imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",model.enName]]];

    
    return cell;

}

@end
