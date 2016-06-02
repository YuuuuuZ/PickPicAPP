//
//  HomeViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"发现";
        self.tabBarItem.title = nil;
        self.tabBarItem.image = [UIImage imageNamed:@"found.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
