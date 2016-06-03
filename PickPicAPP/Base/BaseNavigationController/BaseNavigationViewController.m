//
//  BaseNavigationViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    
    //更改导航栏的背景图片
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabBar_bg.jpg"] forBarMetrics:UIBarMetricsDefault];
}
@end
