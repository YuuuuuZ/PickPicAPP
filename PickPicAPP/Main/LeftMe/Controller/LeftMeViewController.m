//
//  LeftMeViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LeftMeViewController.h"
#import "FollowMeViewController.h"
#import "MyFollowsViewController.h"
#import "CollectionBoxViewController.h"
#import "PostBoxViewController.h"

@interface LeftMeViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)NSArray *text_list;
@property(nonatomic,strong)NSArray *image_list;
@end

@implementation LeftMeViewController
-(instancetype)init{
    if (self = [super init]) {
        self.navigationController.navigationBar.translucent = YES;
        self.view.backgroundColor = [UIColor colorWithRed:171/255.0 green:192/255.0 blue:154/255.0 alpha:1];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _text_list = @[@"我关注的",
                 @"关注我的",
                 @"收集箱",
                 @"发布箱"];
    _image_list = @[[UIImage imageNamed:@"clap_hands_1308.0069124424px_1200169_easyicon.net"],
                    [UIImage imageNamed:@"shake_hands_1431.2839506173px_1200187_easyicon.net"],
                    [UIImage imageNamed:@"browser_669px_1165687_easyicon.net"],
                    [UIImage imageNamed:@"briefcase_669px_1165685_easyicon.net"]];
    
    [self loadTableView];
}
-(void)loadTableView{
    //表视图
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-64)];
    _tableView.backgroundColor = [UIColor clearColor];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    //表视图的头视图
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
    //用户头像
    _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    _headImage.image = [UIImage imageNamed:@"headImage.jpg"];
    _headImage.clipsToBounds = YES;
    _headImage.layer.cornerRadius = 40;
    //用户昵称
    UILabel *nickName = [[UILabel alloc] initWithFrame:CGRectMake(100, 25, 200, 30)];
    nickName.text = @"一名孤独的吃货";
    //用户签名
    UILabel *signText = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 200, 20)];
    signText.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    signText.font = [UIFont systemFontOfSize:14];
    
    [headerView addSubview:_headImage];
    [headerView addSubview:nickName];
    [headerView addSubview:signText];
    
    _tableView.tableHeaderView = headerView;
    [self.view addSubview:_tableView];
    
    //注销按钮
    UIButton *signOut = [[UIButton alloc] initWithFrame:CGRectMake((kScreenW/5*4)/2.0-20, kScreenH-50, 80, 40)];
    [signOut setTitle:@"注销" forState:UIControlStateNormal];
    signOut.backgroundColor = [UIColor redColor];
    [self.view addSubview:signOut];
    
    headerView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageClick)];
    [headerView addGestureRecognizer:gesture];
}
-(void)headImageClick{
    //弹出一个表单选择器
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //为表单选择器添加行为选项
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"更换头像" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //用UIImagePickerController打开相册
        UIImagePickerController *imagePickerC = [[UIImagePickerController alloc] init];
        imagePickerC.delegate = self;
        imagePickerC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerC animated:YES completion:^{
            
        }];
    }]];
    //为表单选择器添加行为选项
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //
        UIImage *image = _headImage.image;
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }]];
    //为表单选择器添加行为选项
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    //弹出表单选择器
    [self presentViewController:actionSheet animated:YES completion:^{
        
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _headImage.image = image;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//保存完图片后 调用的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    
    if (error) {
        NSLog(@"%@",error);
        return;
    }
    NSLog(@"图片保存成功");
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
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
    cell.imageView.image = _image_list[indexPath.row];
    cell.textLabel.text = _text_list[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FollowMeViewController *followMe = [[FollowMeViewController alloc] init];
        [self.navigationController pushViewController:followMe animated:YES];
    }
    else if (indexPath.row == 1){
        MyFollowsViewController *myFollows = [[MyFollowsViewController alloc] init];
        [self.navigationController pushViewController:myFollows animated:YES];
    }
    else if (indexPath.row == 2){
        CollectionBoxViewController *collectionBox = [[CollectionBoxViewController alloc] init];
        [self.navigationController pushViewController:collectionBox animated:YES];
    }
    else if (indexPath.row == 3){
        PostBoxViewController *postBox = [[PostBoxViewController alloc] init];
        [self.navigationController pushViewController:postBox animated:YES];
    }
}

@end
