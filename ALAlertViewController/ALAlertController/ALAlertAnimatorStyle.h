//
//  ALAlertAnimatorStyle.h
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#ifndef ALAlertAnimatorStyle_h
#define ALAlertAnimatorStyle_h

/** present style */
typedef NS_ENUM(NSInteger, ALAlertPresentStyle) {
    ALAlertPresentStyleSystem,          // 系统样式
    ALAlertPresentStyleFadeIn,          // 渐入
    ALAlertPresentStyleBounce,          // 弹出
    ALAlertPresentStyleExpandHorizontal,// 水平展开
    ALAlertPresentStyleExpandVertical,  // 垂直展开
    ALAlertPresentStyleSlideDown,       // 从上往下划入
    ALAlertPresentStyleSlideUp,         // 从下往上划入
    ALAlertPresentStyleSlideLeft,       // 从右往左划入
    ALAlertPresentStyleSlideRight,      // 从左往右划入
    
    ALAlertPresentStyleFlipFromRight,    // 从右侧反转
    
    
    
};

/** dismiss style */
typedef NS_ENUM(NSInteger, ALAlertDismissStyle) {
    ALAlertDismissStyleFadeOut,             // 渐出
    ALAlertDismissStyleContractHorizontal,  // 水平收起
    ALAlertDismissStyleContractVertical,    // 垂直收起
    ALAlertDismissStyleSlideDown,           // 向下划出
    ALAlertDismissStyleSlideUp,             // 向上划出
    ALAlertDismissStyleSlideLeft,           // 向左划出
    ALAlertDismissStyleSlideRight,          // 向右划出
    
    ALAlertDismissStyleFlipFromRight,       // 从右侧反转
};

#endif /* ALAlertAnimatorStyle_h */

