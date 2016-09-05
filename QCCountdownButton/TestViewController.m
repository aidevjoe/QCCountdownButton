//
//  TestViewController.m
//  QCCountdownButton
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import "TestViewController.h"
#import "QCCountdownButton.h"

@interface TestViewController ()
@property (nonatomic, strong) QCCountdownButton *countdownButton;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    QCCountdownButton *btn = [QCCountdownButton countdownButton];
    
    btn.originlTitle = @"获取验证码";
    
    [btn setFrame:CGRectMake(0, 0, 100, 30)];
    btn.center = self.view.center;
    
    // 字体
    btn.titleLabelFont = [UIFont systemFontOfSize:13];
    
    // 普通状态下的背景颜色
    btn.nomalBackgroundColor = [UIColor blueColor];
    
    // 失效状态下的背景颜色
    btn.disabledBackgroundColor = [UIColor grayColor];
    
    // 倒计时的时长
    btn.totalSecond = 5;
    
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

- (void)dealloc{
    [self.countdownButton stopTime];
}


@end
