//
//  ALAlertAction.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ALAlertAction.h"

@implementation ALAlertAction

+ (instancetype)actionWithTitle:(NSString *)title style:(ALAlertActionStyle)style handler:(void (^)())handler{
    ALAlertAction *action = [[ALAlertAction alloc] init];
    action.title = title;
    action.handler = handler;
    action.style = style;
    return action;
}


- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


@end
