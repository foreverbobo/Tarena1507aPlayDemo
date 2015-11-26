//
//  HeroListViewController.m
//  ZiXunSD
//
//  Created by 廖文博 on 15/11/25.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "HeroListViewController.h"
#import "HeroDetailCollectionViewCell.h"
#import "HeroDetailViewController.h"
@interface HeroListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)HeroViewModel *heroVM;
@property (nonatomic,strong)UICollectionView *collectionView;
@end

@implementation HeroListViewController
-(HeroViewModel *)heroVM
{
    if(!_heroVM)
    {
        _heroVM = [[HeroViewModel alloc]initWithHeroType:self.type];
    }
    return _heroVM;
}
-(instancetype)initWithHeroType:(HeroType)type
{
    if(self = [super init])
    {
        self.type = type;
    }
    return self;
}
-(UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[HeroDetailCollectionViewCell class] forCellWithReuseIdentifier:@"Cell"];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.heroVM getDataFromNetCompleteHandle:^(NSError *error) {
                [_collectionView reloadData];
                [_collectionView.mj_header endRefreshing];
            }];
        }];
    }
    return _collectionView;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView.mj_header beginRefreshing];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.heroVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.icon.heroName = [self.heroVM enNameForRow:indexPath.row];
    cell.titleLb.text = [self.heroVM titleForRow:indexPath.row];
    cell.nameLb.text = [self.heroVM cnNameForRow:indexPath.row];
    cell.locationLb.text = [self.heroVM locationForRow:indexPath.row];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroDetailViewController *detailVC = [[HeroDetailViewController alloc]initWithHeroInfoDic:[self.heroVM heroInfoDicForRow:indexPath.row]];
    [self.navigationController pushViewController:detailVC animated:YES];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kWindowW - 15)/2, 60);
}


@end
