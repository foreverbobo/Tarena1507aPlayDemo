//
//  MyInfoViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/5.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "MyInfoViewController.h"
#import "WBImageView.h"
#import "MyInputCell.h"
#import "MyRegisterViewController.h"
@interface MyInfoViewController ()<UITableViewDelegate,UITableViewDataSource,MyInputCellDelegate>
@property (nonatomic,strong)TPKeyboardAvoidingTableView *tableView;
@property (nonatomic,weak)UITextField *userTextField;
@property (nonatomic,weak)UITextField *pswTextField;
@end

@implementation MyInfoViewController
+(UINavigationController *)standardMyInfoNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MyInfoViewController *vc = [MyInfoViewController new];
        navi = [[UINavigationController alloc]initWithRootViewController:vc];
        
    });
    return navi;
}
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
    [FactoryClass addMenuItemToVC:self];
    [FactoryClass addShareItemToVC:self];
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
    FUIButton *loginBtn = [FUIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.buttonColor = [UIColor amethystColor];
    loginBtn.shadowColor = [UIColor greenSeaColor];
    [loginBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [footView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(300, 30));
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(20);
    }];
#pragma mark -- 登录功能实现
    [loginBtn bk_addEventHandler:^(id sender) {
        BmobQuery   *bquery = [BmobQuery queryWithClassName:@"user"];
        [bquery whereKey:@"userName" equalTo:self.userTextField.text];
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if(!error)
            {
                BmobObject *obj = array.firstObject;
                NSString *pwd = [obj objectForKey:@"userPwd"];
                if([pwd isEqualToString:self.pswTextField.text])
                {
                    [MBProgressHUD showSuccess:@"登陆成功"];
                }
                else
                {
                    [MBProgressHUD showError:@"登陆失败"];
                }
            }
        }];
        
        
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    forgetBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [footView addSubview:forgetBtn];
    [forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(loginBtn.mas_leftMargin).mas_equalTo(-10);
        make.top.mas_equalTo(loginBtn.mas_bottom).mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
#pragma mark --忘记密码功能实现
    [forgetBtn bk_addEventHandler:^(id sender) {
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIButton *regisBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [regisBtn setTitle:@"注册新用户" forState:UIControlStateNormal];
    [regisBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    regisBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    regisBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [footView addSubview:regisBtn];
    [regisBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.rightMargin.mas_equalTo(loginBtn.mas_rightMargin).mas_equalTo(10);
        make.top.mas_equalTo(loginBtn.mas_bottom).mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(100, 20));
    }];
#pragma mark -- 注册功能实现
    [regisBtn bk_addEventHandler:^(id sender) {
        MyRegisterViewController *vc = [MyRegisterViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableFooterView = footView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.delegate = self;
    if(indexPath.row == 0)
    {
        cell.textfield.placeholder = @"请输入账号";
        self.userTextField = cell.textfield;
    }
    else
    {
        cell.textfield.placeholder = @"请输入密码";
        cell.textfield.secureTextEntry = YES;
        self.pswTextField = cell.textfield;
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
