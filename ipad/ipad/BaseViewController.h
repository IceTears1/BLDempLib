//
//  BaseViewController.h
//  ipad
//
//  Created by 冰泪 on 2017/7/13.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIDeviceOrientationIsPortrait(orientation)  ((orientation) == UIDeviceOrientationPortrait || (orientation) == UIDeviceOrientationPortraitUpsideDown)
#define UIDeviceOrientationIsLandscape(orientation) ((orientation) == UIDeviceOrientationLandscapeLeft || (orientation) == UIDeviceOrientationLandscapeRight)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

@interface BaseViewController : UIViewController

//iphone的横竖屏
@property (nonatomic,assign) BOOL isPhonePortrait;

//ipad的横竖屏
@property (nonatomic,assign) BOOL isPadPortrait;

@property (nonatomic,copy) NSString *prefixStr;
-(void)deviceOrientationDidChange;
-(NSString *)formatImgPath:(NSString *)imgPath;
@end
