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
    
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MainColor,UITextAttributeTextColor,nil]];
    
    [[UINavigationBar appearance] setTintColor:MainColor];
}
@end
