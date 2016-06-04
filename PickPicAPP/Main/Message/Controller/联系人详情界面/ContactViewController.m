//
//  ContactViewController.m
//  PickPicAPP
//
//  Created by BEVER on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ContactViewController.h"
#import "ChatViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)sengMessage:(UIButton *)sender {
    
    UIStoryboard *moreSB = [UIStoryboard storyboardWithName:@"ChatViewController" bundle:[NSBundle mainBundle]];
    
    ChatViewController *moreTVC = [moreSB instantiateInitialViewController];
    
   [self presentViewController:moreTVC animated:YES completion:^{
       
   }];
    NSLog(@"...");

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
