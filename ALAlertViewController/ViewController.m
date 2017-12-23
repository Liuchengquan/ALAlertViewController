//
//  ViewController.m
//  ALAlertViewController
//
//  Created by liuchengquan on 2017/12/21.
//  Copyright © 2017年 liuchengquan. All rights reserved.
//

#import "ViewController.h"
#import "ALAlertController.h"
#import "ALAlertPresentAnimator.h"
#import "ALAlertDismissAnimator.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"vc";
    self.view.backgroundColor = [UIColor cyanColor];

    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"123123" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 20, 60, 40);
    [self.view addSubview:button];

}


-(void)actionClick:(UIButton *)btn{

    ALAlertController * alert = [ALAlertController alertWithTitle:nil message:@"本产品还未付款，确认客户需要并本店无货，需要订单转移到亿茶网进货吗？"];
    [alert setAlertViewCornerRadius:10];
    
    // action
    ALAlertAction * action1 = [ALAlertAction actionWithTitle:@"取消" style:ALAlertActionStyleCancel handler:^{
        
        
        
        
    }];
//    ALAlertAction * action2 = [ALAlertAction actionWithTitle:@"确定" style:ALAlertActionStyleDefault handler:^{
//
//    }];
    ALAlertAction * action2 = [[ALAlertAction alloc] init];
    action2.title = @"确定";
    action2.backgroundColor = [UIColor redColor];
    action2.titleColor = [UIColor whiteColor];
    
    action2.handler = ^{
        NSLog(@"------- 确定！！！！ -------");
    };
    ALAlertAction * action3 = [ALAlertAction actionWithTitle:@"action3" style:ALAlertActionStyleDefault handler:^{

    }];
    ALAlertAction * action4 = [ALAlertAction actionWithTitle:@"action4" style:ALAlertActionStyleDefault handler:^{
        
    }];
    ALAlertAction * action5 = [ALAlertAction actionWithTitle:@"action5" style:ALAlertActionStyleCancel handler:^{
        
    }];
    ALAlertAction * action6 = [ALAlertAction actionWithTitle:@"action6" style:ALAlertActionStyleDefault handler:^{
        
    }];

//    for (int i = 0 ; i < arc4random_uniform(5)+1 ; i ++) {
//        [alert addAction:@[action1,action2,action3,action4,action5,action6][i]];
//    }
//    [alert addActions:@[action1,action2,action3,action4,action5,action6]];

//[alert addActions:@[action1,action2]];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [alert addAction:action4];
    [alert addAction:action5];
    [alert addAction:action6];

    alert.presentStyle = ALAlertPresentStyleSystem;

    [self presentViewController:alert animated:YES completion:nil];
}






@end
