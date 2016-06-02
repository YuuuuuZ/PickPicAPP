//
//  UICollectionViewCellPhoto.m
//  PickPic
//
//  Created by apple on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UICollectionViewCellPhoto.h"

@implementation UICollectionViewCellPhoto

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    self.photo = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.photo];
    return (self);
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.photo.image = nil;
    self.photo.frame = self.contentView.bounds;
}

@end
