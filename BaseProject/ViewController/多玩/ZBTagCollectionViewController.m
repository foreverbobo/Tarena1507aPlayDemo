//
//  ZBTagCollectionViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "ZBTagCollectionViewController.h"
#import "ZBTagViewModel.h"
#import "EquipCollectionViewCell.h"
#import "ZBDetailViewController.h"

@interface ZBTagCollectionViewController ()
@property (nonatomic,strong)ZBTagViewModel *zbVM;
@end

@implementation ZBTagCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
-(ZBTagViewModel *)zbVM
{
    if(!_zbVM)
    {
        _zbVM = [[ZBTagViewModel alloc]initWithTag:self.tag];
    }
    return _zbVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [FactoryClass addReturnItemToVC:self];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[EquipCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.zbVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
            if(self.zbVM.rowNumber == 0)
            {
                [self showErrorMsg:@"该页没数据"];
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.zbVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EquipCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.nameLB.text = [self.zbVM textForRow:indexPath.row];
    cell.iconView.equipId = [self.zbVM idforRow:indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZBDetailViewController *vc = [[ZBDetailViewController alloc]initWithEquipId:[self.zbVM idforRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
