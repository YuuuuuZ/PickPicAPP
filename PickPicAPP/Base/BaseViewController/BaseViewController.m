//
//  BaseViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(instancetype)init{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor colorWithRed:171/255.0 green:192/255.0 blue:154/255.0 alpha:1];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
