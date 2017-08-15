//
//  ViewController.m
//  简单实现stack
//
//  Created by 冰泪 on 2017/2/14.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 1个1个拿，正好拿完。
 2个2个拿，还剩1个。
 3个3个拿，正好拿完。
 4个4个拿，还剩1个。
 5个5个拿，还差1个。
 6个6个拿，还剩3个。
 7个7个拿，正好拿完。
 8个8个拿，还剩1个。
 9个9个拿，正好拿完。

 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arry = [[NSMutableArray alloc]init];
    for (NSInteger a=1; a<10; a++) {
        [arry addObject:[NSString stringWithFormat:@"%ld",a]];
        
    }
//    NSLog(@"%@",arry);
    
    // 遍历数组
    [arry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"-----%@",obj);
        NSLog(@"%ld",idx);
//        if (idx ==5) {
//            *stop =1;//退出遍历
//        }
    }];
    //随机遍历
    [arry enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"111---%@",obj);
    }];
    //倒序遍历
    [arry enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"222---%@",obj);
    }];
    
    
        //    NSInteger a=0;
//    for (NSInteger a=1; a<100000000000000000; a++) {
//        if (a%2==1){
//            
//        }else{
//            continue;
//        }
//            
//        if (a%3==0){
//            
//        }else{
//            continue;
//        }
//            
//        if (a%4==1){
//            
//        }else{
//            continue;
//        }
//        if (a%5==4){
//            
//        }else{
//            continue;
//        }
//        if (a%6==3){
//            
//        }else{
//            continue;
//        }
//        if (a%7==0){
//            
//        }else{
//            continue;
//        }
//        if (a%8==1){
//            
//        }else{
//            continue;
//        }
//        if (a%9==0){
//            NSLog(@"-----%ld",a);
//        }else{
//            continue;
//        }
//        
//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
