//
//  WaterFallLayout.m
//  UI高级-瀑布流
//
//  Created by wangjin on 16/5/31.
//  Copyright © 2016年 wangjin. All rights reserved.
//

#import "WaterFallLayout.h"

//固定列数
#define kColumns 2
//单元格之间的间隙
#define kSpace 10

//初始的距离四边间隙
static const UIEdgeInsets kDefaultInsets = {10,10,10,10};

@interface WaterFallLayout()

@property(nonatomic, strong) NSMutableArray *columHeights;//存放列高度的数组

@property(nonatomic, strong) NSMutableArray *attributeArrs;//存放单元格布局属性的数组

@end


@implementation WaterFallLayout

//使用懒加载方式加载columHeights
-(NSMutableArray *)columHeights
{
    if (!_columHeights) {
        _columHeights = [[NSMutableArray alloc] init];
    }
    return _columHeights;
}

-(NSMutableArray *)attributeArrs
{
    if (!_attributeArrs) {
        _attributeArrs = [[NSMutableArray alloc] init];
    }
    
    return _attributeArrs;
}

//视图单元格开始做布局时被调用，在该方法中实现单元格布局
-(void)prepareLayout
{
    //1.使用数组保存每一列的高度
    //添加数组元素 在添加之前先移除
    [self.columHeights removeAllObjects];
    
    for (int i=0; i<kColumns; i++) {
        
        //添加每一列的高度
        [self.columHeights addObject:@(kDefaultInsets.top)];
        
    }
    
    
    //2。获取所有的单元格， 并且设置布局
    NSInteger sectionNumber = [self.collectionView numberOfSections];
    
    for (int i=0; i<sectionNumber; i++) {
        
        //获取分组的单元格数
        NSInteger cellNumber = [self.collectionView numberOfItemsInSection:i];
        
        for (int j=0; j<cellNumber; j++) {
            
            //创建单元格的indexPath
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            
            //获取单元格的布局属性 --方法复写做布局
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            
            //将布局属性添加到数组中
            [self.attributeArrs addObject:attrs];
            
        }
        
    }
    
    
}

//复写该方法做单元格的布局
-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //获取当前但与昂的布局属性
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //设置单元格布局
    //1.设置单元格的宽 宽 = （父视图的宽- 左右的偏移量 - 单元格间隙）/列数
    CGFloat  cellWith = (self.collectionView.frame.size.width - kDefaultInsets.left - kDefaultInsets.right - (kColumns-1)*kSpace)/kColumns;
    
    //2.设置单元格高度 高度为不定值 随机获取
    CGFloat cellHeight = 100 + arc4random_uniform(150);
    
    //3.设置x轴
    //记录高度最小列的下标
    NSInteger minHeightIndex = 0;//默认第一列
    
    //记录最小高度
    CGFloat minHeight = [self.columHeights[0] floatValue];
    
    for (int i=1; i<kColumns; i++) {
        
        //获取第i的高度
        CGFloat columnHeight = [self.columHeights[i] floatValue];
        
        //判断当前列的高度与记录的最小列的高度大小 小的将被重新记录
        if (minHeight > columnHeight) {
            
            minHeight = columnHeight;//重新记录最小高度
            
            minHeightIndex = i;//记录最小高度列的下标
        }
        
    }
    //3.x轴坐标 = 距离左边的偏移量 + （当前列数-1）*（单元格宽度+间隙）
    CGFloat x = kDefaultInsets.left + minHeightIndex*(cellWith+kSpace);
    
    //4.y轴坐标 = 最小列高度+间隙
    CGFloat y = kDefaultInsets.top;
    
    if(minHeight != kDefaultInsets.top)
    {
        y = minHeight + kSpace;
    }
    
    //更新单元格布局
    attr.frame = CGRectMake(x, y, cellWith, cellHeight);
    
    //更新最短列的高度
    self.columHeights[minHeightIndex] = @(CGRectGetMaxY(attr.frame));
    
    return attr;
}
//返回所有单元格的布局属性，系统将根据该属性进行布局
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.attributeArrs;
}

//当单元格布局后设置内容尺寸
-(CGSize)collectionViewContentSize
{
    //设置最高高度
    CGFloat maxHeight = [self.columHeights[0] floatValue];
    
    for (int i=1; i<kColumns; i++) {
        
        //获取第i列的高度
        CGFloat columnHeight = [self.columHeights[i] floatValue];
        
        //判断如果当前maxHeight小于columnHeight，则重新复制新高度
        if (maxHeight<columnHeight) {
            maxHeight = columnHeight;
        }
        
    }
    
    //返回内容尺寸
    return CGSizeMake(0, maxHeight+kDefaultInsets.bottom);
}
@end
