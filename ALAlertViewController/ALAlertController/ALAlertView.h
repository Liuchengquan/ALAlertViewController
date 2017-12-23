//
//  ALAlertView.h
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ALAlertAction;
@interface ALAlertView : UIView

@property (nonatomic , weak ,nullable) UIViewController * controller;

- (_Nonnull instancetype) initWithTitle:(NSString * _Nullable)title message:(NSString * _Nullable)message;

- (void)addAction:(ALAlertAction * _Nonnull)action;

@end
