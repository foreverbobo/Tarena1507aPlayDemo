//
//  PageViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>
@property (nonatomic,strong)UIPageViewController *pageVC;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic,strong)NSMutableArray *buttonArr;
@property (nonatomic,assign)NSInteger laterIndex;
@end

@implementation PageViewController
-(instancetype)initWithControlArray:(NSArray *)controllArray buttonNameArr:(NSArray *)buttonNameArr topHeight:(CGFloat)topHeight selectImage:(UIImage *)selectImage unSelectImage:(UIImage *)unSelectImage
{
    if(self = [super init])
    {
        self.controllersArray = controllArray;
        self.buttonNameArr = buttonNameArr;
        self.topHeight = topHeight;
        self.selectImage = selectImage;
        self.unSelectImage = unSelectImage;
    }
    return self;
}
- (NSMutableArray *)buttonArr {
    if(_buttonArr == nil) {
        _buttonArr = [[NSMutableArray alloc] init];
    }
    return _buttonArr;
}

-(UIView *)headView
{
    if(!_headView)
    {
        _headView = [[UIView alloc]initWithFrame:CGRectZero];
        _headView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_headView];
        [_headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(0);
            make.height.mas_equalTo(self.topHeight);
        }];
        
        UIButton *lastButton = nil;
        for (NSString *buttonName in self.buttonNameArr) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:buttonName forState:UIControlStateNormal];
            [button setTitleColor:kRGBColor(89, 89, 89) forState:UIControlStateNormal];
            [button setBackgroundImage:self.selectImage forState:UIControlStateSelected];
            [button setBackgroundImage:self.unSelectImage forState:UIControlStateNormal];
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self.buttonArr addObject:button];
            [_headView addSubview:button];
            if(lastButton)
            {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(lastButton);
                    make.left.mas_equalTo(lastButton.mas_right).mas_equalTo(0);
                    make.topMargin.mas_equalTo(lastButton.mas_topMargin).mas_equalTo(0);
                }];
                
            }
            else
            {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.top.bottom.mas_equalTo(0);
                }];
            }
            if([self.buttonNameArr indexOfObject:buttonName] == self.buttonNameArr.count - 1)
            {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.mas_equalTo(0);
                }];
            }
            lastButton = button;
        }
        UIButton *button1 = self.buttonArr[0];
        button1.selected = YES;
        
    }
    return _headView;
}

-(UIPageViewController *)pageVC
{
    if(!_pageVC)
    {
        _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageVC.delegate = self;
        _pageVC.dataSource = self;
        
        [_pageVC setViewControllers:@[self.controllersArray.firstObject] direction:0 animated:YES completion:nil];
    }
    return _pageVC;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addMenuItemToVC:self];
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.headView.mas_bottom).mas_equalTo(0);
    }];
    
}
-(void)click:(UIButton *)sender
{
    for (UIButton *button in self.buttonArr) {
        if(sender == button)
        {
            sender.selected = NO;
        }
        if([button isSelected])
        {
            button.selected = NO;
        }
    }
    NSInteger index = [self.buttonArr indexOfObject:sender];
    sender.selected = !sender.selected;
    id obj = self.controllersArray[index];
    if(obj)
    {
        if(index > self.laterIndex)
        {
            
            [self.pageVC setViewControllers:@[obj] direction:0 animated:YES completion:nil];
        }
        else
        {
            [self.pageVC setViewControllers:@[obj] direction:1 animated:YES completion:nil];
        }
    }
    self.laterIndex = index;
    
}
-(void)selectButton
{
    
    id currentVC = self.pageVC.viewControllers.firstObject;
    NSInteger index = [self.controllersArray indexOfObject:currentVC];
    UIButton *button = (UIButton *)self.buttonArr[index];
    [self click:button];
    
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [self.controllersArray indexOfObject:viewController];
    if(index == 0)
    {
        index = self.controllersArray.count;
    }
    id obj = self.controllersArray[index - 1];
    return obj;
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [self.controllersArray indexOfObject:viewController];
    if(index == self.controllersArray.count - 1)
    {
        index = -1;
    }
    id obj = self.controllersArray[index + 1];
    return obj;
    
}
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    if(finished)
    {
        [self selectButton];
    }
    
}




@end
