//
//  ALAlertAction.h
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger , ALAlertActionStyle) {
    ALAlertActionStyleDefault,
    ALAlertActionStyleCancel,
    ALAlertActionStyleDestructive
};



@interface ALAlertAction : NSObject
/** 标题*/
@property (nonatomic , strong) NSString * title;
/** 背景色*/
@property (nonatomic , strong) UIColor  * backgroundColor;
/** 标题颜色*/
@property (nonatomic , strong) UIColor  * titleColor;
/** action*/
@property (nonatomic , copy) void (^handler)();
/** 样式 */
@property (nonatomic , assign) ALAlertActionStyle style;



+ (instancetype)actionWithTitle:(NSString *)title style:(ALAlertActionStyle)style handler:(void(^)())handler;

- (instancetype)actionWithTitle:(NSString *)title style:(ALAlertActionStyle)style handler:(void(^)())handler;



@end
