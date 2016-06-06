//
//  LoginViewController.h
//  PickPicAPP
//
//  Created by mac on 16/6/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^StartBlock)(void);

@interface LoginViewController : UIViewController

@property(nonatomic,copy)StartBlock startBlock;

-(void)setStartBlock:(StartBlock)startBlock;

@end
