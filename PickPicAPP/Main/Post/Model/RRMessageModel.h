//
//  RRMessageModel.h
//  PickPic
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RRMessageModel : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSMutableArray *photos;

@end
