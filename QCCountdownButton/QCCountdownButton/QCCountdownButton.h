//
//  QCCountdownButton.h
//  QCCountdownButton
//
//  Created by Joe on 16/9/5.
//  Copyright © 2016年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QCCountdownButton : UIButton

/**
 *  总时间
 */
@property (nonatomic, assign) NSUInteger totalSecond;

/**
 *  nomalBackgroundColor : 普通状态下的背景颜色 disabledBackgroundColor :失效状态下的背景颜色
 */
@property (nonatomic, strong) UIColor *nomalBackgroundColor, *disabledBackgroundColor;

/**
 *  设置文字
 */
@property (nonatomic, copy) NSString *title;

/**
 *  设置文字字体
 */
@property (nonatomic, strong) UIFont *titleLabelFont;

/**
 *  创建实例对象
 *
 *  @return QCCountdownButton
 */
+ (instancetype)countdownButton;

/**
 *  获取倒计时进度
 *
 *  @param processBlock  倒计时进度
 *  @param finishedBlock 计时完成回调
 */
- (void)processBlock:(void (^)(NSUInteger second))processBlock onFinishedBlock:(void (^)())finishedBlock;

/**
 *  停止计时
 */
- (void)stopTime;

@end
