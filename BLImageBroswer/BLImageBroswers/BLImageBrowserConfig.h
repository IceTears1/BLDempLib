//
//  BLImageBrowserConfig.h
//  BLImagePickerVCDemo
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#ifndef BLImageBrowserConfig_h
#define BLImageBrowserConfig_h

#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

//#define CELL_COLLECTION_WIDTH   ([UIScreen mainScreen].bounds.size.width-20) / 6.0
#define CELL_COLLECTION_WIDTH   ((([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)-20) / 6.0)
#define CELL_COLLECTION_WIDTH_IPHONE   ((([UIScreen mainScreen].bounds.size.width<[UIScreen mainScreen].bounds.size.height?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)-20) / 4.0)

//在iphone上面运行
#define IS_IPHONE ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone ? YES : NO)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorFromRGBValue(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];

//解决ios10 真机模式下不打印问题
#ifdef DEBUG

#define DDLOG(...) printf(" %s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#else

#define DDLOG(...) ;
#define DDLOG_CURRENT_METHOD ;

#endif


#endif /* BLImageBrowserConfig_h */
