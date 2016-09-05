//
//  ViewController.m
//  QCCountdownButton
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "QCCountdownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QCCountdownButton *btn = [QCCountdownButton countdownButton];
    btn.title = @"获取验证码";
    
    [btn setFrame:CGRectMake(0, 0, 100, 30)];
    btn.center = self.view.center;
    
    // 字体
    btn.titleLabelFont = [UIFont systemFontOfSize:13];
    
    // 普通状态下的背景颜色
    btn.nomalBackgroundColor = [UIColor redColor];
    
    // 失效状态下的背景颜色
    btn.disabledBackgroundColor = [UIColor grayColor];
    
    // 倒计时的时长
    btn.totalSecond = 5;
    
    [self.view addSubview:btn];
    
    //进度b
    [btn processBlock:^(NSUInteger second) {
        btn.title = [NSString stringWithFormat:@"(%lis)后重新获取", second] ;
    } onFinishedBlock:^() {  // 倒计时完毕
        btn.title = @"重新获取验证码";
    }];
}


@end
