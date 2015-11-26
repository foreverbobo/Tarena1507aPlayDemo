//
//  MyRegisterViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/16.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "MyRegisterViewController.h"
#import "MyInputCell.h"
#import "WBImageView.h"
@interface MyRegisterViewController ()<UITableViewDelegate,UITableViewDataSource,MyInputCellDelegate>
@property (nonatomic,strong)TPKeyboardAvoidingTableView *tableView;
@end

@implementation MyRegisterViewController
- (TPKeyboardAvoidingTableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[MyInputCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addReturnItemToVC:self];
    [self settingHeadView];
    [self settingFootView];
}
-(void)settingHeadView
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 150)];
    WBImageView *image = [WBImageView new];
    [image.imageView setImage:[UIImage imageNamed:@"bg_msgbox_1"]];
    [headView addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    [image.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(150, 0, 0, 0));
    }];
    self.tableView.tableHeaderView = headView;
}
-(void)settingFootView
{
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 150)];
    FUIButton *registBtn= [FUIButton buttonWithType:UIButtonTypeCustom];
    registBtn.buttonColor = [UIColor amethystColor];
    registBtn.shadowColor = [UIColor greenSeaColor];
    [registBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [registBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [footView addSubview:registBtn];
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 30));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];
#pragma mark -- 注册功能实现
    [registBtn bk_addEventHandler:^(id sender) {
       
    } forControlEvents:UIControlEventTouchUpInside];


 

    self.tableView.tableFooterView = footView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.delegate = self;
    if(indexPath.row == 0)
    {
        cell.textfield.placeholder = @"请输入账号";
    }
    else if(indexPath.row == 1)
    {
        cell.textfield.placeholder = @"请输入密码";
        cell.textfield.secureTextEntry = YES;
    }
    else
    {
        cell.textfield.placeholder = @"请确认密码";
        cell.textfield.secureTextEntry = YES;
    }
    cell.textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
#pragma mark - TestCellDelegate
- (void)clickNextItemInMyInputCellCell:(MyInputCell *)cell{
    [_tableView focusNextTextField]; //光标下移
}


@end
