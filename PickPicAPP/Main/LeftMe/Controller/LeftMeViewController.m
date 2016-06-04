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
#import "MyInfoViewController.h"

@interface LeftMeViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *nickName;
@property(nonatomic,strong)UILabel *signText;
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
                 @"发布箱",
                   @"修改密码"];
    _image_list = @[[UIImage imageNamed:@"browser_669px_1165687_easyicon.net"],
                    [UIImage imageNamed:@"browser_669px_1165687_easyicon.net"],
                    [UIImage imageNamed:@"browser_669px_1165687_easyicon.net"],
                    [UIImage imageNamed:@"briefcase_669px_1165685_easyicon.net"],
                    [UIImage imageNamed:@"browser_669px_1165687_easyicon.net"]];
    
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
    [headerView addSubview:_headImage];
    
    UIView *changeInfoView = [[UIView alloc] initWithFrame:CGRectMake(100, 0, kScreenW-100, 100)];
    [headerView addSubview:changeInfoView];
    //用户昵称
    _nickName = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 200, 30)];
    _nickName.text = @"这里显示的是昵称";
    //用户签名
    _signText = [[UILabel alloc] initWithFrame:CGRectMake(0, 55, 200, 20)];
    _signText.text = @"这里显示的是个性签名,谢谢";
    _signText.font = [UIFont systemFontOfSize:14];
    
    [changeInfoView addSubview:_nickName];
    [changeInfoView addSubview:_signText];
    
    _tableView.tableHeaderView = headerView;
    [self.view addSubview:_tableView];
    
    //注销按钮
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 500, 80, 40)];
    [btn setTitle:@"修改密码" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    //注销按钮
    UIButton *signOut = [[UIButton alloc] initWithFrame:CGRectMake(180, 500, 80, 40)];
    [signOut setTitle:@"注销" forState:UIControlStateNormal];
    signOut.backgroundColor = [UIColor redColor];
    [self.view addSubview:signOut];
    
    _headImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageClick)];
    [_headImage addGestureRecognizer:gesture];
    
    changeInfoView.userInteractionEnabled = YES;
    UITapGestureRecognizer *changeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeMyInfo)];
    [changeInfoView addGestureRecognizer:changeGesture];
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
-(void)changeMyInfo{
    MyInfoViewController *myInfoVC = [[MyInfoViewController alloc] init];
    [self.navigationController pushViewController:myInfoVC animated:YES];
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
//        
//        UITabBarController *tab = [[UITabBarController alloc]init];
//        
//        id next = [self nextResponder];
//        
//        if (![next isKindOfClass:[UITabBarController class]]) {
//            
//            next = [next nextResponder];
//        }else if ([next isKindOfClass:[UITabBarController class]]){
//            
//            tab = (UITabBarController *)next;
//            
//            NSLog(@"%@",tab);
//            
//        }
        
        //  [tab.view bringSubviewToFront:followMe.view];
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
