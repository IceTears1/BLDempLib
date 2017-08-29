//
//  UIImagePickerController+landscape.m
//  ipad
//
//  Created by 冰泪 on 2017/7/18.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "UIImagePickerController+landscape.h"

@implementation UIImagePickerController (landscape)
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}
@end
