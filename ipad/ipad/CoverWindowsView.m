//
//  CoverWindowsView.m
//  ipad
//
//  Created by 冰泪 on 2017/8/2.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "CoverWindowsView.h"

#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)

@implementation CoverWindowsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.frame =CGRectMake(0, 0,DeviceMaxWidth , DeviceMaxHeight);
        [self initData];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    UIWindow* currentWindow = [UIApplication sharedApplication].keyWindow;
    [currentWindow addSubview:self];
}

@end
