//
//  ViewController.m
//  QCCountdownButton
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import "ViewController.h"
#import "QCCountdownButton.h"
#import "TestViewController.h"

@interface ViewController ()

@property (nonatomic, strong) QCCountdownButton *countdownButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QCCountdownButton *btn = [QCCountdownButton countdownButton];
    
    //最初状态的文字
    btn.originlTitle = @"获取验证码";
    
    [btn setFrame:CGRectMake(0, 0, 100, 30)];
    btn.center = self.view.center;
    
    // 字体
    btn.titleLabelFont = [UIFont systemFontOfSize:13];
    
    // 普通状态下的背景颜色
    btn.nomalBackgroundColor = [UIColor redColor];
    
    // 失效状态下的背景颜色
    btn.disabledBackgroundColor = [UIColor grayColor];
    
    // 倒计时的时长
    btn.totalSecond = 60;
    
    [self.view addSubview:btn];
    
    self.countdownButton = btn;
    
    //进度
    [btn processBlock:^(NSUInteger second) {
        NSLog(@"%li", second);
        btn.title = [NSString stringWithFormat:@"(%lis)后重新获取", second] ;
    } onFinishedBlock:^{  // 倒计时完毕
        btn.title = @"重新获取验证码";
    }];
    
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.countdownButton stopTime];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}


@end
