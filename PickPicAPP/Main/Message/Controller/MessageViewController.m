//
//  MessageViewController.m
//  PickPic
//
//  Created by mac on 16/6/1.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "MessageViewController.h"
#import "ContactViewController.h"
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MessageViewController
-(instancetype)init{
    if (self = [super init]) {
        self.title = @"联系人";
        self.tabBarItem.title = nil;
        self.tabBarItem.image = [UIImage imageNamed:@"contect.png"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *_tvContact = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    
    _tvContact.delegate = self;
    
    _tvContact.dataSource = self;
    
    [self.view addSubview:_tvContact];
    
}
#pragma mark --UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identy = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identy];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identy];
    }
    
    cell.backgroundColor = [UIColor cyanColor];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    ContactViewController *_contactVC = [[ContactViewController alloc] init];
    
    UIStoryboard *moreSB = [UIStoryboard storyboardWithName:@"ContactViewController" bundle:[NSBundle mainBundle]];
    
    ContactViewController *moreTVC = [moreSB instantiateInitialViewController];
    
    [self.navigationController pushViewController:moreTVC animated:YES];
    NSLog(@"...");
}

@end
