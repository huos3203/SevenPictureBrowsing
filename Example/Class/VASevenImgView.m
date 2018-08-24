//
//  SevenImgView.m
//  JHVideoRecording
//
//  Created by admin on 2018/8/23.
//  Copyright © 2018年 jinher. All rights reserved.
//

#import "VASevenImgView.h"

@implementation VASevenImgView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self addShowButton];
        [self addnumLabel];
    }
    return self;
}
-(void)addShowButton
{
    CGFloat wh = self.frame.size.width;
    CGRect butFrame = CGRectMake(5, 5, wh - 5, wh - 5);
    _showSevenImgButton = [[UIButton alloc] initWithFrame:butFrame];
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"JHAudioPlayResources" ofType:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:@"zhinengzhaopian.tiff" inBundle:resourceBundle compatibleWithTraitCollection:nil];
    //    [_showSevenImgButton setImage:image forState:UIControlStateNormal];
    _showSevenImgButton.layer.cornerRadius = _showSevenImgButton.frame.size.width/2;
    _showSevenImgButton.layer.masksToBounds = YES;
    UIColor *black = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
    [_showSevenImgButton setBackgroundColor:black];
    [_showSevenImgButton setImage:[UIImage imageNamed:@"zhinengzhaopian"] forState:UIControlStateNormal];
    [self addSubview:_showSevenImgButton];
}
-(void)addnumLabel
{
    //图片个数
    _sevenImgNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    _sevenImgNumLabel.text = @"9";
    _sevenImgNumLabel.textColor = [UIColor whiteColor];
    _sevenImgNumLabel.backgroundColor = [UIColor redColor];
    _sevenImgNumLabel.textAlignment = NSTextAlignmentCenter;
    CGFloat numX = self.frame.size.width - 5;
    CGFloat numY = 5;
    _sevenImgNumLabel.center = CGPointMake(numX, numY);
    _sevenImgNumLabel.font = [UIFont systemFontOfSize:10];
    _sevenImgNumLabel.layer.cornerRadius = _sevenImgNumLabel.frame.size.width/2;
    _sevenImgNumLabel.layer.masksToBounds = YES;
    [self addSubview:_sevenImgNumLabel];
}
@end
