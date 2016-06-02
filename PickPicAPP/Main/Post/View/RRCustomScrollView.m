//
//  RRCustomScrollView.m
//  PickPic
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "RRCustomScrollView.h"

@implementation RRCustomScrollView
- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ([view isKindOfClass:[UIButton class]])
        return YES;
    return NO;
}


@end
