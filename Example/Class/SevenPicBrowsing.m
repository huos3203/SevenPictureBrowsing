//
//  SevenPicBrowsing.m
//  SevenPictureBrowsing_Example
//
//  Created by admin on 2018/8/18.
//  Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "SevenPicBrowsing.h"
@implementation SevenPicCell

@end

@interface SevenPicBrowsing()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
@implementation SevenPicBrowsing
{
    CGFloat itemSpacing;
    CGFloat itemWidth;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    itemSpacing = 5;
    itemWidth = 92;
}
#pragma mark UI事件
- (IBAction)ibaLeftAction:(id)sender {
    
}
- (IBAction)ibaRightAction:(id)sender {
}

#pragma mark delegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imgArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SevenPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SevenPicBrowsing" forIndexPath:indexPath];
    UIImage *img = self.imgArr[indexPath.row];
    cell.imageView.image = img;
    return cell;
}

#pragma mark - UIScrollViewDelegate
//预计出大概位置，经过精确定位获得准备位置
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGPoint targetOffset = [self nearestTargetOffsetForOffset:*targetContentOffset];
    targetContentOffset->x = targetOffset.x;
    targetContentOffset->y = targetOffset.y;
}
//计算落在哪个item上
- (CGPoint)nearestTargetOffsetForOffset:(CGPoint)offset
{
    CGFloat pageSize = itemSpacing + itemWidth;
    //四舍五入
    NSInteger page = roundf(offset.x / pageSize);
    CGFloat targetX = pageSize * page;
    return CGPointMake(targetX, offset.y);
}

@end
