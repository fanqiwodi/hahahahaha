//
//  ViewController.m
//  BSEquxian
//
//  Created by 范琦 on 16/1/8.
//  Copyright (c) 2016年 范琦. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CustomView *custom = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [self.view addSubview:custom];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
