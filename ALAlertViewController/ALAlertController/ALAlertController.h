//
//  ALAlertController.h
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAlertAction.h"
#import "ALAlertAnimatorStyle.h"
/** 背景透明度 */
static const CGFloat al_backgroundAlpha = 0.4;

@interface ALAlertController : UIViewController

@property (nonatomic ,strong, nullable) UIView *alertView;

/** 背景， 默认灰色半透明*/
@property (nonatomic ,strong) UIView *backgroundView;

/** 转场动画*/
@property (nonatomic , assign) ALAlertPresentStyle presentStyle;

@property (nonatomic , assign) ALAlertDismissStyle dismissStyle;
/**
 
*/

/**
 * 设置圆角
 * @param cornerRadius
 */
- (void) setAlertViewCornerRadius:(CGFloat)cornerRadius;

/**
 * 添加单个动作
 * @param action
 */
- (void) addAction:(ALAlertAction *)action;

/**
 * 添加动作组
 * @param actions
 */
- (void) addActions:(NSArray<ALAlertAction *> *)actions;


/**
 * 默认初始化方式
 * @param 标题
 * @param 内容
 * @return
 */
+ (instancetype)alertWithTitle:(NSString * _Nullable)title
                       message:(NSString * _Nullable)massgae;




@end
