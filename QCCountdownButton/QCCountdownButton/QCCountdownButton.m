//
//  QCCountdownButton.m
//  QCCountdownButton
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import "QCCountdownButton.h"

@interface QCCountdownButton ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSUInteger second;

@property (nonatomic, copy) void(^processBlock)(NSUInteger second);

@property (nonatomic, copy) void(^finishedBlock)();

@end

@implementation QCCountdownButton


+ (instancetype)shareInstance{
    static QCCountdownButton *shareInstance  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [QCCountdownButton buttonWithType:UIButtonTypeCustom];
    });
    
    return shareInstance;
}

+ (instancetype)countdownButton{
    QCCountdownButton *btn = [self buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor grayColor]];
    return btn;
}

- (void)startTime{
    
    self.second = self.totalSecond;
    
    self.userInteractionEnabled = NO;
    self.backgroundColor = self.disabledBackgroundColor ? self.disabledBackgroundColor : self.nomalBackgroundColor;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)timerFire{
    
    self.second --;
    
    !self.processBlock ? : self.processBlock(self.second);

    if (self.second <= 0) {
        [self stopTime];
        !self.finishedBlock ? : self.finishedBlock();
    }
}

- (void)stopTime{
    if (self.timer) {
        if ([self.timer respondsToSelector:@selector(isValid)]){
            if ([self.timer isValid]){
                [self.timer invalidate];
                self.second = self.totalSecond;
                self.userInteractionEnabled = YES;
                self.backgroundColor = self.nomalBackgroundColor;
            }
        }
    }
}

- (void)setTotalSecond:(NSUInteger)totalSecond{
    _totalSecond = totalSecond;
    
    [self addTarget:self action:@selector(startTime) forControlEvents:UIControlEventTouchUpInside];
}

- (void)processBlock:(void (^)(NSUInteger))processBlock onFinishedBlock:(void (^)())finishedBlock{
    self.processBlock = [processBlock copy];
    self.finishedBlock = [finishedBlock copy];
}

- (void)setNomalBackgroundColor:(UIColor *)color{
    _nomalBackgroundColor = color;
    self.backgroundColor = color;
}

- (void)setTitle:(NSString *)title{
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)setTitleLabelFont:(UIFont *)titleLabelFont{
    [self.titleLabel setFont:titleLabelFont];
}
@end
