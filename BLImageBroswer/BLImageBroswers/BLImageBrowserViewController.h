//
//  BLImageBrowserViewController.h
//  BLImagePickerVCDemo
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BLImageBrowserViewController : UIViewController
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)NSMutableArray *dataSource;
/*
 最大的放大倍数
 默认2
 */
@property (nonatomic, assign)CGFloat maxZoom;
/*
 最小缩小倍数
 默认1
 */
@property (nonatomic, assign)CGFloat minZoom;

/*
 初始倍数默认为1
 */
@property (nonatomic, assign)CGFloat zoom;
/*
 图片模式
 默认UIViewContentModeScaleAspectFit
 */
@property (nonatomic, assign)UIViewContentMode contentMode;
/*
 开启反弹
 */
@property (nonatomic, assign)BOOL bounces;


/*
  进入后显示的图片索引
 */
@property (nonatomic, assign)CGFloat index;

/*
 是否展示分享按钮
 默认 yes
 */
@property (nonatomic, assign)BOOL showShareBtn;

/*
 是否显示 底部索引内容
 默认 yes
 */
@property (nonatomic, assign)BOOL showIndexBtn;

/*
 是否 轮播
 默认 yes
 */
@property (nonatomic, assign)BOOL isShuffling;

@end
