//
//  ALAlertDismissAnimator.h
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAlertAnimatorStyle.h"

@interface ALAlertDismissAnimator : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic,  assign) ALAlertDismissStyle dismissStyle;
@end
