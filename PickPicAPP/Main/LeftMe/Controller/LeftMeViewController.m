//
//  LeftMeViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LeftMeViewController.h"

@interface LeftMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *text_list;
@property(nonatomic,strong)NSArray *image_list;
@end

@implementation LeftMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _text_list = @[@"我关注的",
                 @"关注我的",
                 @"收集箱",
                 @"发布箱"];
    _image_list = @[[UIImage imageNamed:@"Conversion_802px_1141917_easyicon.net"],
                    [UIImage imageNamed:@"Creative_568px_1141925_easyicon.net"],
                    [UIImage imageNamed:@"Link_Building_764px_1141913_easyicon.net"],
                    [UIImage imageNamed:@"Location_568px_1141916_easyicon.net"]];
    
    [self loadTableView];
}
-(void)loadTableView{
    //表视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenW, kScreenH-64-100)];
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //表视图的头视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
    //用户头像
    UIImageView *headImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 0, 100, 100)];
    headImage.image = [UIImage imageNamed:@"headImage.jpg"];
    headImage.clipsToBounds = YES;
    headImage.layer.cornerRadius = 50;
    //用户昵称
    UILabel *nickName = [[UILabel alloc] initWithFrame:CGRectMake(130, 20, 200, 30)];
    nickName.text = @"一名孤独的吃货";
    //用户签名
    UILabel *signText = [[UILabel alloc] initWithFrame:CGRectMake(130, 55, 200, 25)];
    signText.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    signText.font = [UIFont systemFontOfSize:14];
    
    [headerView addSubview:headImage];
    [headerView addSubview:nickName];
    [headerView addSubview:signText];
    
    _tableView.tableHeaderView = headerView;
    [self.view addSubview:_tableView];
    
    //注销按钮
    UIButton *signOut = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW/2-100, kScreenH-50, 80, 40)];
    [signOut setTitle:@"注销" forState:UIControlStateNormal];
    signOut.backgroundColor = [UIColor redColor];
    [self.view addSubview:signOut];
}
#pragma mark ----- UITableViewDataSource -----
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _text_list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.height, cell.frame.size.height)];
//    imageView.image = _image_list[indexPath.row];
//    cell.imageView.frame = CGRectMake(0, 0, cell.frame.size.height, cell.frame.size.height);
    cell.imageView.image = _image_list[indexPath.row];
    cell.textLabel.text = _text_list[indexPath.row];
    return cell;
}
@end
