//
//  ViewController.m
//  WKAlertView
//
//  Created by AISION on 2018/3/9.
//  Copyright © 2018年 xiaokai.wang. All rights reserved.
//

#import "ViewController.h"
#import "WKAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WKAlertView *alert = [[WKAlertView alloc]initWithTitle:@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" picture:@"haha" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定"];
    alert.layerBorderColor = [UIColor redColor];
    alert.delegate = self;
    //    alert.fontSize = 18;
    [self.view addSubview:alert];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
