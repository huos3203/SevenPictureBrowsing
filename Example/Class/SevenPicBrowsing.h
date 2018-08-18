//
//  SevenPicBrowsing.h
//  SevenPictureBrowsing_Example
//
//  Created by admin on 2018/8/18.
//  Copyright © 2018年 huo3203@hotmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SevenPicCell:UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView*imageView;
@end

@interface SevenPicBrowsing : UIView
@property (strong, nonatomic) NSArray<UIImage *> *imgArr;
@end
