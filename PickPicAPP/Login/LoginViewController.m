//
//  LoginViewController.m
//  PickPicAPP
//
//  Created by BEVER on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "LoginViewController.h"
#import <MaxLeap/MaxLeap.h>
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)login:(UIButton *)sender {
    
    
    if (_startBlock) {
        
        NSLog(@"开启体验");
        
        _startBlock();
        
    }
    [self myMethod];

}
- (void)myMethod {
    
    MLUser *user = [MLUser user];
    user.username = _userName.text;
    user.password = _password.text;
    //user.email = @"email@example.com";
    // other fields can be set just like with MLObject
    //user[@"mobilePhone"] = @"415-392-0202";
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // Hooray! Let them use the app now.
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}
- (IBAction)register:(UIButton *)sender {
}
- (IBAction)thredLogin:(UIButton *)sender {
}
- (IBAction)forget:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
