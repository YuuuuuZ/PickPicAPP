//
//  PostViewController.h
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RRMessageModel.h"
#import "UICollectionViewCellPhoto.h"

@protocol RRSendMessageDelegate;

@interface PostViewController : BaseViewController<UICollectionViewDelegate,
UICollectionViewDataSource, UITextViewDelegate>

@property (nonatomic, assign) id<RRSendMessageDelegate> delegate;

@property (nonatomic, assign) NSInteger numberPhoto;

- (void) presentController:(UIViewController *)parentController :(void (^)(RRMessageModel *model, BOOL isCancel))completion;


@end
@protocol RRSendMessageDelegate <NSObject>

@optional
- (void) messageCancel;
- (void) getMessage:(RRMessageModel *)message;

@end
