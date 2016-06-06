//
//  MyInfoViewController.m
//  PickPicAPP
//
//  Created by mac on 16/6/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MyInfoViewController.h"

@interface MyInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *loginName;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextView *signText;


@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadMyInfo];
}
-(void)loadMyInfo{
//    MLUser *currentUser = [MLUser currentUser];
    _loginName.text = currentUser.username;
    
    _nickName.text = [currentUser objectForKey:@"nickName"];
    _phoneNumber.text = [NSString stringWithFormat:@"%@",[currentUser objectForKey:@"phoneNumber"]];
    _email.text = currentUser.email;
    _signText.text = [currentUser objectForKey:@"personalSign"];
}
- (IBAction)saveMyInfo:(UIButton *)sender {
//    MLUser *currentUser = [MLUser currentUser];
    [currentUser setValue:_nickName.text forKey:@"nickName"];
    [currentUser setValue:[NSNumber numberWithFloat:[_phoneNumber.text floatValue]] forKey:@"phoneNumber"];
    currentUser.email = _email.text;
    [currentUser setValue:_signText.text forKey:@"personalSign"];
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            
            //将昵称和签名信息保存到前一页
            
            _myBlock([currentUser objectForKey:@"nickName"],[currentUser objectForKey:@"personalSign"]);
            
            UIAlertController *saveSuccess = [UIAlertController alertControllerWithTitle:@"保存信息成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [saveSuccess addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

            }]];
            [self presentViewController:saveSuccess animated:YES completion:nil];
        }else{
            NSLog(@"信息保存失败%@",error);
            UIAlertController *saveFail = [UIAlertController alertControllerWithTitle:@"保存信息失败" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [saveFail addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            [self presentViewController:saveFail animated:YES completion:nil];
        }
    }];
}

@end
