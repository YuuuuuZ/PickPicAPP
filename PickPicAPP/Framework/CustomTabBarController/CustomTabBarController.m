//
//  CustomTabBarController.m
//  03自定义标签控制器
//
//  Created by CORYIL on 16/3/8.
//  Copyright © 2016年 徐锐. All rights reserved.
//

#import "CustomTabBarController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kSelectedImageTopSpace 2

@interface CustomTabBarController ()

@property (nonatomic,strong) UIView *customTabBar;

@property (nonatomic,strong) UIImage *selectImg;

@property (nonatomic,strong) UIImage *bgImg;//私有属性保存背景图片

@property (nonatomic,strong) UIImageView *selectIV;//选中item背景图片视图

@end

@implementation CustomTabBarController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    _selectIV.frame = CGRectMake(10 + self.selectedIndex * kScreenWidth/self.viewControllers.count, kSelectedImageTopSpace, kScreenWidth/self.viewControllers.count-20, 44);
    
}


- (instancetype)initWithSelectedImage:(UIImage *)selectedImage tabBarBackgroundImage:(UIImage *)bgImage{

    if (self = [super init]) {
        
        _selectImg = selectedImage;
        
        _bgImg = bgImage;
        
    }
    return self;
}



- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{

    [super setViewControllers:viewControllers];
    
    /**
     *  执行完上面的方法
     
        可以得到当前本控制器管理的视图控制器个数
        
     1.移除原有的按钮 tabbarItem
     2.添加自定义的 tabbarItem
     3.更改背景图片
     4.自定义的选中图片
     */
    [self removeTabBarButtons];
    
    [self createNewTabBar];
    
    [self createTabBarButton];
    
}




#pragma mark --1.移除原有的所有tabBarButton
/**
 * 1⃣️.移除tabbar上所有的tabbarItem
 */
- (void)removeTabBarButtons{

    
    
//    NSLog(@"%@",self.tabBar.subviews);
    
    for (UIView *subView in self.tabBar.subviews) {
        
        /**
         *  NSClassFromString(NSString *aClassName) -> 将字符串转化为对应的类名
         
         UITabBarButton -> 标签控制器定义的内部类[tabbar上的按钮]
         */
        
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            [subView removeFromSuperview];
        }
    }
}

/**
 *  2⃣️创建新的有背景图的tabbar
 */
- (void)createNewTabBar{

    _customTabBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, 49)];
    
//    _customTabBar.backgroundColor = [UIColor colorWithPatternImage:[_bgImg stretchableImageWithLeftCapWidth:160 topCapHeight:25]];
    _customTabBar.backgroundColor = [UIColor whiteColor];
    
    [self.tabBar addSubview:_customTabBar];
}

/**
 *  3⃣️创建标签按钮
 */
- (void)createTabBarButton{
    
    //1.获取控制器个数
    NSInteger count = self.viewControllers.count;
    
    
    
    //✅选中的背景图片
    _selectIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, kSelectedImageTopSpace, kScreenWidth/count-20, 44)];
    
    //    _selectIV.image = [_selectImg stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>];
    
    _selectIV.image = _selectImg;
    
    [_customTabBar addSubview:_selectIV];
    
    
    
    
    
    /*————————————————————————————————————————————————————————————————————————————*/
    //✅创建按钮
    
    //2.根据个数创建按钮
    
    for (int i = 0; i<count; i++) {
        
        //计算按钮的frame
        CGRect itemFrame = CGRectMake(i * kScreenWidth/count, 0, kScreenWidth/count, 49);
        
        //获取按钮对应的控制器的item
        UITabBarItem *tabBarItem = self.viewControllers[i].tabBarItem;
        
        //创建
        CustomTabBarItem *item = [[CustomTabBarItem alloc]initWithFrame:itemFrame tabBarItem:tabBarItem index:i];
        
        //tag值
        item.tag = 100 + i;
        
        //添加事件
        [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [_customTabBar addSubview:item];
        
        
    }
    
}

- (void)itemClick:(UIButton *)item{
    
    //✅切换视图控制器
    
    //1.获取点击按钮的index
    NSInteger index = item.tag - 100;
    
    //2.更改当前显示的VC
    self.selectedIndex = index;
    
    /*————————————————————————————————————————————————————————————————————————————*/
    
    //✅选中图片移动动画
    
    // CGRectMake(10, 5, kScreenWidth/count-20, 44)];
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _selectIV.frame = CGRectMake(10 + self.selectedIndex * kScreenWidth/self.viewControllers.count, kSelectedImageTopSpace, kScreenWidth/self.viewControllers.count-20, 44);
        
    }];
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];

}



@end

/*------------------------------------------------------------------------------------------*/




@implementation CustomTabBarItem

- (instancetype)initWithFrame:(CGRect)frame tabBarItem:(UITabBarItem *)tabBarItem index:(NSInteger)index{
    
    if (self = [super initWithFrame:frame]) {
        
        /**
         *  tabBarItem:包含创建item所需要的title和image
         */
        
        //创建ImageView Label
        
        //1⃣️ Label
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 20)];
        
        //居中
        label.textAlignment = NSTextAlignmentCenter;
        
        //字号
        label.font = [UIFont systemFontOfSize:10];
        
        //颜色
        label.textColor = [UIColor whiteColor];
        
        //内容 --> 从tabBarItem获取
        label.text = tabBarItem.title;
        
//        [self addSubview:label];
        
        //2⃣️ Image
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-29)/2, 20, 29, 29)];
        
        //内容模式
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        //图片 --> 从tabBarItem获取
        imageView.image = tabBarItem.image;
        
        if (tabBarItem.title) {
            [self addSubview:label];
            [self addSubview:imageView];
        }
        else{
            imageView.frame = CGRectMake((frame.size.width-40)/2, 4, 40, 40);
//            
//            if (index == 2) {
//                [self addSubview:imageView];
//                imageView.transform = CGAffineTransformMakeScale(1.8, 1.8);
//            }
            [self addSubview:imageView];
        }
    }
    return self;
}

@end
