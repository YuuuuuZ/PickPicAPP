//
//  MessageViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"联系人";
        self.tabBarItem.title = nil;
        self.tabBarItem.image = [UIImage imageNamed:@"contect.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
