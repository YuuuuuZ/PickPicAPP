//
//  HomeViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HomeViewController.h"
#import "picDetails.h"
#import "WaterFallLayout.h"
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HomeViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"发现";
        self.tabBarItem.title = nil;
        self.tabBarItem.image = [UIImage imageNamed:@"found.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    //设置布局类
    WaterFallLayout *layout = [[WaterFallLayout alloc] init];
    
    //创建collection视图
    UICollectionView *_collection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-49-10-5) collectionViewLayout:layout];
    
    _collection.backgroundColor = [UIColor whiteColor];
    
    _collection.delegate = self;
    
    _collection.dataSource = self;
    
    //注册单元格
    [_collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collection];
    
}

#pragma mark ----  UICollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor orangeColor];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    picDetails *_picdetail = [[picDetails alloc] init];
    
    [self presentViewController:_picdetail animated:YES completion:^{
        
    }];
    NSLog(@"111");
}

@end