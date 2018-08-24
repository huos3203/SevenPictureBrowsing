//
//  SevenPicBrowsing.m
//  SevenPictureBrowsing_Example
//
//  Created by admin on 2018/8/18.
//  Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import "SevenPicBrowsing.h"
#import "SevenImgCapture.h"
#import "JHLazyTableImages.h"

@implementation SevenPicCell
-(void)awakeFromNib
{
    [super awakeFromNib];
    self.progressView.font = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:5];
    self.progressView.popUpViewAnimatedColors =@[[UIColor greenColor],[UIColor greenColor]];
}
#pragma mark getter/setter
-(void)setModel:(ArchiveCameraModel *)model
{
    _model = model;
    [self.ibAddBut setImage:model.image forState:UIControlStateNormal];
    self.progressView.progress = model.pregress.floatValue;
}
@end

@interface VASevenImgView()
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *ibShowImgConstraint;

@end
@implementation VASevenImgView

-(void)awakeFromNib{
    [super awakeFromNib];
    _sevenImgNumLabel.layer.cornerRadius = _sevenImgNumLabel.frame.size.width/2;
    _sevenImgNumLabel.layer.masksToBounds = YES;
}

-(void)sevenCapture
{
    [SevenImgCapture shared].title = @"智慧培训";
    [SevenImgCapture shared].complexMethod = ComplexMethodLeftRight;
    __weak typeof(self) weakSelf = self;
    [[SevenImgCapture shared] captureImage:^(UIImage *image) {
        if (image) {
            ArchiveCameraModel *model = [ArchiveCameraModel new];
            [[SevenImgCapture shared] threeInfo];
            model.image = [[SevenImgCapture shared] complexText];
            [weakSelf.sevenPicBrowsing.imgArr addObject:model];
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [weakSelf.sevenPicBrowsing.collectionView reloadData];
            }];
        }
    }];
}

- (IBAction)ibaShowSevenImgAction:(id)sender {
    if (!_showSevenImgButton.isSelected) {
        _showSevenImgButton.selected = YES;
        [UIView animateWithDuration:1.0 animations:^{
            _ibShowImgConstraint.constant = 0;
            [self layoutIfNeeded];
        }];
    }else{
        _showSevenImgButton.selected = NO;
        [UIView animateWithDuration:1.0 animations:^{
            CGFloat dd = self.frame.size.width/2;
            _ibShowImgConstraint.constant = -dd;
            [self layoutIfNeeded];
        }];
    }
}

@end

@interface SevenPicBrowsing()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) JHLazyTableImages *lazyCollImages;
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
    [self.collectionView registerClass:[SevenPicCell class] forCellWithReuseIdentifier:@"SevenPicBrowsing"];
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
    cell.model = self.imgArr[indexPath.row];
    cell.model.indexPath = indexPath;
    if (cell.model.lazyStatus != Succeeded) {
        [self.lazyCollImages addUploadImageForCell:cell withModel:cell.model];
    }
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

-(NSMutableArray<ArchiveCameraModel *> *)imgArr
{
    if (!_imgArr) {
        _imgArr = [NSMutableArray new];
    }
    return _imgArr;
}
-(JHLazyTableImages *)lazyCollImages
{
    if (!_lazyCollImages) {
        _lazyCollImages = [JHLazyTableImages new];
        _lazyCollImages.delegate = self;
        _lazyCollImages.collectionView = self.collectionView;
    }
    return _lazyCollImages;
}
@end
