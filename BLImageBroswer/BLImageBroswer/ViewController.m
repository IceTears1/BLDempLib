//
//  ViewController.m
//  BLImageBroswer
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"
#import "BLImageBrowserViewController.h"
#import "OneViewController.h"

//解决ios10 真机模式下不打印问题
#ifdef DEBUG

#define DDLOG(...) printf(" %s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#else

#define DDLOG(...) ;
#define DDLOG_CURRENT_METHOD ;

#endif
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 200)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)aaa{
//    OneViewController *one = [[OneViewController alloc]init];
//    one.myBlock = ^(NSInteger a) {
//        DDLOG(@"接收到的值 ----%ld",a);
//        DDLOG(@" 当前线程  %@",[NSThread currentThread]);
//    },
//    [self presentViewController:one animated:YES completion:nil];
    NSArray *ary = @[[UIImage imageNamed:@"111.jpg"],[UIImage imageNamed:@"222.jpg"],[UIImage imageNamed:@"333.jpg"],[UIImage imageNamed:@"444.jpg"],[UIImage imageNamed:@"555.jpg"],[UIImage imageNamed:@"666.jpg"],[UIImage imageNamed:@"777.jpg"]];
    BLImageBrowserViewController *imageVC = [[BLImageBrowserViewController alloc]init];
    imageVC.dataSource = [NSMutableArray arrayWithArray:ary];
//    imageVC.contentMode = UIViewContentModeScaleAspectFit;
    [self presentViewController:imageVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
