//
//  BaseViewController.m
//  ipad
//
//  Created by 冰泪 on 2017/7/13.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "BaseViewController.h"

#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
}
-(void)deviceOrientationDidChange{
    
    if (isphone) {
        self.prefixStr = @"iPhone";
        //如果iphone 适配横竖屏 宽高使用这个
        if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
            NSLog(@"竖屏");
            self.isPhonePortrait = YES;
        }else{
            NSLog(@"横屏");
            self.isPhonePortrait = NO;
        }
    }
    if (isPad) {
        self.prefixStr = @"ipad";
        if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
            NSLog(@"竖屏");
            self.isPadPortrait = YES;
        }else{
            NSLog(@"横屏");
           self.isPadPortrait = NO;
        }
    }
     NSLog(@"q222:%f ---%f",DeviceMaxWidth,DeviceMaxHeight);
//    NSLog(@"1111111:%f ---%f",self.adapterDeviceMaxWidth,self.adapterDeviceMaxHeight);
//    [self.view reloadInputViews];
    
}
-(NSString *)formatImgPath:(NSString *)imgPath{
    return [NSString stringWithFormat:@"%@-%@",self.prefixStr,imgPath];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
