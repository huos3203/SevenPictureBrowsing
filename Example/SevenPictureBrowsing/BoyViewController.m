//
//  BoyViewController.m
//  SevenPictureBrowsing
//
//  Created by huo3203@hotmail.com on 08/18/2018.
//  Copyright (c) 2018 huo3203@hotmail.com. All rights reserved.
//

#import "BoyViewController.h"
#import "SevenPicBrowsing.h"
#import "VASevenImgView.h"

@interface BoyViewController ()
@property (strong, nonatomic) IBOutlet SevenPicBrowsing *ibPicBrowsingView;

@end

@implementation BoyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *imgArr = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [imgArr addObject:img];
    }
    self.ibPicBrowsingView.imgArr = imgArr;
    
    //图标点
    //右上角
    CGFloat x = [UIScreen mainScreen].bounds.size.width - 60;
    CGFloat y = 10;
    CGFloat wh = 30;
    CGRect sevenFrame = CGRectMake(x, y, wh, wh);
    VASevenImgView *sevenimg = [[VASevenImgView alloc] initWithFrame:sevenFrame];
//    [sevenimg.showSevenImgButton setImage:[UIImage imageNamed:@"zhinengzhaopian"] forState:UIControlStateNormal];
    [self.view addSubview:sevenimg];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
