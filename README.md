# QCCountdownButton

在我们开发中常常会遇到注册、验证信息的需求这个时候我们需要向服务器发送请求来获得验证码,通常需要进行获取倒计时操作.多个地方用到时候就会导致代码杂乱不堪,这个库的出现就是解决这个问题,以至于简化你的操作,把注意放在代码逻辑上即可

## Gif示例

![image](https://github.com/Joe0708/QCCountdownButton/blob/master/Demo.gif?raw=true)


## 使用

    
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
    btn.totalSecond = 5;
    
    [self.view addSubview:btn];
    
    //倒计时进度
    [btn processBlock:^(NSUInteger second) {
        btn.title = [NSString stringWithFormat:@"(%lis)后重新获取", second] ;
    } onFinishedBlock:^() {  // 倒计时完毕
        btn.title = @"重新获取验证码";
    }];

---
如果你有任何使用问题,请在这里[提问](https://github.com/Joe0708/QCCountdownButton/issues/new)

Qq群: 248458280
