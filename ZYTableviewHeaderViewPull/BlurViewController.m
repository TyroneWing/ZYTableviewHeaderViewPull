//
//  BlurViewController.m
//  ZYTableviewHeaderViewPull
//
//  Created by yi on 16/2/14.
//  Copyright © 2016年 yi. All rights reserved.
//



/**
 *      高斯模糊
 */

#import "BlurViewController.h"
#import "UIImage+ImageEffects.h"

@interface BlurViewController ()
@property (nonatomic,strong) UIImageView *blurImageView;

@end

@implementation BlurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    /**
     *   高斯模糊
     */
    [self createImageView];
}


- (void)createImageView
{
    _blurImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 280, 280)];
    
    UIImage *blurImage = [UIImage imageNamed:@"FriendsBackground"];
    blurImage = [blurImage applyBlurWithRadius:5 tintColor:[UIColor colorWithWhite:0.6 alpha:0.2] saturationDeltaFactor:1.0 maskImage:nil];
//    blurImage = [blurImage applySubtleEffect];
    _blurImageView.image = blurImage;
    [self.view addSubview:_blurImageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
