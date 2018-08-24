//
//  SevenPicBrowsing.h
//  SevenPictureBrowsing_Example
//
//  Created by admin on 2018/8/18.
//  Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArchiveCameraModel.h"
#import "HSProgressPopUpView.h"

@interface SevenPicCell:UICollectionViewCell
@property (strong, nonatomic) ArchiveCameraModel *model;
@property (strong, nonatomic) IBOutlet UIButton *ibAddBut;
@property (strong, nonatomic) IBOutlet HSProgressPopUpView *progressView;
@end

@interface SevenPicBrowsing : UIView
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<ArchiveCameraModel *> *imgArr;
@end


@interface VASevenImgView:UIView
@property (strong, nonatomic) IBOutlet UIButton *showSevenImgButton;
@property (strong, nonatomic) IBOutlet UILabel *sevenImgNumLabel;
@property (strong, nonatomic) IBOutlet SevenPicBrowsing *sevenPicBrowsing;
-(void)sevenCapture;
@end
