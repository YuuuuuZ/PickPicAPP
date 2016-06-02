//
//  PostViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"发布";
        self.tabBarItem.title = nil;
        self.tabBarItem.image = [UIImage imageNamed:@"found.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
