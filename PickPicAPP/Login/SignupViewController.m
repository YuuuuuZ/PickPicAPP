//
//  SignupViewController.m
//  PickPicAPP
//
//  Created by mac on 16/6/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SignupViewController.h"
#import <MaxLeap/MaxLeap.h>

@interface SignupViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)signup:(UIButton *)sender {
    if (_username.text.length > 0 && _password.text.length > 0) {
        MLUser *user = [MLUser user];
        user.username = _username.text;
        user.password = _password.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
            if (!error) {
                //如果成功 则让用户进入这个APP
                UIAlertController *success = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [success addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                }]];
                [self presentViewController:success animated:YES completion:nil];
            }else{
                //打印错误信息  "最可能的情况就是该用户名或邮箱已被其他用户使用"
                NSLog(@"errorString:%@",[error userInfo][@"error"]);
                //让用户再试一次
                UIAlertController *fail = [UIAlertController alertControllerWithTitle:@"注册失败,请重新注册" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [fail addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                [self presentViewController:fail animated:YES completion:nil];
            }
        }];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请输入用户名和密码" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
