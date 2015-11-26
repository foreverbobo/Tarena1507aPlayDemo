//
//  SkillCollectionViewController.m
//  BaseProject
//
//  Created by 廖文博 on 15/11/12.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "SkillCollectionViewController.h"
#import "EquipCollectionViewCell.h"
#import "SkillViewModel.h"
#import "SkillDetailViewController.h"
@interface SkillCollectionViewController ()
@property (nonatomic,strong)SkillViewModel *skillVM;
@end

@implementation SkillCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
-(SkillViewModel *)skillVM
{
    if(!_skillVM)
    {
        _skillVM = [SkillViewModel new];
    }
    return _skillVM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [FactoryClass addReturnItemToVC:self];
    [self.collectionView registerClass:[EquipCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.skillVM getDataFromNetCompleteHandle:^(NSError *error) {
            [self.collectionView reloadData];
            [self.collectionView.mj_header endRefreshing];
        }];
    }];
    [self.collectionView.mj_header beginRefreshing];
    
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.skillVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EquipCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.nameLB.text = [self.skillVM nameForRow:indexPath.row];
    cell.iconView.skillId = [self.skillVM idForRow:indexPath.row];
    
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SkillDetailViewController *vc = [[SkillDetailViewController alloc]initWithDataDic:[self.skillVM dataDicForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
