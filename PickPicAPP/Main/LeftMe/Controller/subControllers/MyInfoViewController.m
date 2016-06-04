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
    
    
}
- (IBAction)saveMyInfo:(UIButton *)sender {
}

@end
