//
//  picDetails.m
//  PickPic
//
//  Created by BEVER on 16/6/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "picDetails.h"

@interface picDetails ()

@end

@implementation picDetails

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
