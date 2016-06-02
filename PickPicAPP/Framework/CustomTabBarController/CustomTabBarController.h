//
//  CustomTabBarController.h
//  03自定义标签控制器
//
//  Created by CORYIL on 16/3/8.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBarItem;

@interface CustomTabBarController : UITabBarController

- (instancetype)initWithSelectedImage:(UIImage *)selectedImage tabBarBackgroundImage:(UIImage *)bgImage;

@end

/*--------------------------------------------------------------------------------*/

@interface CustomTabBarItem : UIButton

/**
 *  通过frame和tabBarItem创建按钮的方法
 */
- (instancetype)initWithFrame:(CGRect)frame tabBarItem:(UITabBarItem *)tabBarItem index:(NSInteger)index;


@end
