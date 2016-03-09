//
//  ViewController.m
//  VerificationCodeDemo
//
//  Created by 阳永辉 on 16/3/9.
//  Copyright © 2016年 HuiDe. All rights reserved.
//

#import "ViewController.h"
#import "AuthcodeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AuthcodeView *auView = [[AuthcodeView alloc] init];
    auView.frame = CGRectMake(0, 0, self.view.frame.size.width /3, self.view.frame.size.height/3);
    [self.view addSubview:auView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
