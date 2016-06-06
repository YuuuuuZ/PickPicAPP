//
//  ResetPasswordViewController.m
//  PickPicAPP
//
//  Created by BEVER on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ResetPasswordViewController.h"

@interface ResetPasswordViewController (){
    UIView *_view;
}
@property (weak, nonatomic) IBOutlet UITextField *email;

@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)post:(UIButton *)sender {
    
   [MLUser requestPasswordResetForEmailInBackground:_email.text block:^(BOOL succeeded, NSError * _Nullable error) {
       
       if (succeeded ==YES) {
         
           [UIView animateWithDuration:1 animations:^{
               
               [self loadLabel];
               
               _view.hidden = NO;
               
           } completion:^(BOOL finished) {
               
               _view.hidden = YES;
           }];
           
           
       }else{
           
           NSLog(@"%@",error);
       }
       
   }];
}
-(void)loadLabel{
    
    _view = [[UIView alloc]initWithFrame:CGRectMake(200, 350, 30, 30)];
    
    UILabel *label = [[UILabel alloc]initWithFrame:_view.frame];
    
    label.text = @"发送成功";
    
    [_view addSubview:label];
    
    _view.hidden = YES;
    
    [self.view addSubview:_view];
    
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
