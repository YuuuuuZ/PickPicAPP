//
//  ChatViewController.m
//  PickPicAPP
//
//  Created by BEVER on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *msgText;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@end

@implementation ChatViewController

//返回
- (IBAction)back:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.tableView.frame;
    
    frame.size.height = frame.size.height-64;
    
    self.tableView.frame = frame;
    
    //键盘自动接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboadShow:) name:UIKeyboardWillShowNotification object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboadHid:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer *tag = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    
    [_tableView addGestureRecognizer:tag];
}

#pragma mark -------- 键盘通知
-(void)keyboadShow:(NSNotification *)noti
{
    NSDictionary *userInfo = [noti userInfo];
    
    CGSize keyboadSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    NSTimeInterval time = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:time animations:^{
        
        _tableView.transform = CGAffineTransformMakeTranslation(0, -keyboadSize.height);
        
        _bottomView.transform = CGAffineTransformMakeTranslation(0, -keyboadSize.height);
        
    }];
    
}

-(void)keyboadHid:(NSNotification *)noti
{
    NSDictionary *userInfo = [noti userInfo];
    
    NSTimeInterval time = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:time animations:^{
        
        _tableView.transform = CGAffineTransformIdentity;
        
        
        _bottomView.transform = CGAffineTransformIdentity;
    }];
}

#pragma mark -------- 点击手势
//收起键盘
-(void)tapAction
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
