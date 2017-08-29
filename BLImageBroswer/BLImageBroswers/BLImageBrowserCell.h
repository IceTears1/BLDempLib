//
//  BLImageBrowserCell.h
//  BLImagePickerVCDemo
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLImageBrowserCell : UICollectionViewCell<UIScrollViewDelegate>
- (void)initImage:(UIImage*) image;
@property (nonatomic, strong)UIImageView  *bgImageView;
@property (nonatomic, strong)UIScrollView  *scrollView;

@property (nonatomic, assign)CGFloat maxZoom;

@property (nonatomic, assign)CGFloat minZoom;


@property (nonatomic, assign)CGFloat zoom;
@property (nonatomic, assign)BOOL bounces;
@property (nonatomic, assign)UIViewContentMode contentMode;
@end
