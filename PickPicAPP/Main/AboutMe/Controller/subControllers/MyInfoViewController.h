//
//  MyInfoViewController.h
//  PickPicAPP
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MyBlock)(NSString *nickName,NSString *personalSign);
@interface MyInfoViewController : UIViewController

@property(nonatomic,copy)MyBlock myBlock;

-(void)setMyBlock:(MyBlock)myBlock;
@end
