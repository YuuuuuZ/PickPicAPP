//
//  LoginViewController.m
//  PickPicAPP
//
//  Created by mac on 16/6/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import <MaxLeap/MaxLeap.h>
#import "SignupViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    
    _loginButton.clipsToBounds = YES;
    _loginButton.layer.cornerRadius = 20;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)login:(UIButton *)sender {
    if (_username.text.length > 0 && _password.text.length > 0) {
        [MLUser logInWithUsernameInBackground:_username.text password:_password.text block:^(MLUser * _Nullable user, NSError * _Nullable error) {
            if (user) {
                // Do stuff after successful login.
                UIAlertController *success = [UIAlertController alertControllerWithTitle:@"登录成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
                [success addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    if (_startBlock) {
                        _startBlock();
                    }
                }]];
                [self presentViewController:success animated:YES completion:nil];
            }else{
                // The login failed. Check error to see why.
                UIAlertController *fail = [UIAlertController alertControllerWithTitle:@"登录失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
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
- (IBAction)signup:(UIButton *)sender {
    SignupViewController *signupVC = [[SignupViewController alloc] init];
    [self presentViewController:signupVC animated:YES completion:nil];
}

@end
