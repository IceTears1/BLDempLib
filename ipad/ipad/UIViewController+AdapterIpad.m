//
//  UIViewController+AdapterIpad.m
//  ipad
//
//  Created by 冰泪 on 2017/7/13.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "UIViewController+AdapterIpad.h"
#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
    Stuff; \
    _Pragma("clang diagnostic pop") \
} while (0)

@implementation UIViewController (AdapterIpad)

-(void)observerDeviceOrientation{
    
    if(isPad){
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
   
}
-(void)observerDeviceOrientation:(SEL)select{
    SuppressPerformSelectorLeakWarning([self performSelector:select]);
}
-(void)deviceOrientationDidChange{
    if(UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        NSLog(@"竖屏");
//        #define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//        #define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
    }else{
        NSLog(@"横屏");
//        #define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.height)
//        #define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.width)
    }
//    NSLog(@"%f ---%f",SCREEN_HEIGHT,SCREEN_WIDTH);
}
@end
