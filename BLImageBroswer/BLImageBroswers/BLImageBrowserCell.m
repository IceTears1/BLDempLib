//
//  BLImageBrowserCell.m
//  BLImagePickerVCDemo
//
//  Created by 冰泪 on 2017/8/7.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "BLImageBrowserCell.h"
#import "BLImageBrowserConfig.h"


@interface BLImageBrowserCell()
{
    CGFloat curScale;
}
@end


@implementation BLImageBrowserCell

-(void)initImage:(UIImage *)image{
    [self addSubview:self.scrollView];
    self.scrollView.zoomScale = self.zoom;
    curScale = self.zoom;
    self.bgImageView.image = image;
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.bgImageView;
}
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView  = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
//        _bgImageView.contentMode = self.contentMode;
        _bgImageView.center = self.scrollView.center;
        _bgImageView.userInteractionEnabled = YES;
        [self.scrollView addSubview:_bgImageView];
        
        
        UITapGestureRecognizer *singleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singleTap1:)];
        //点击的次数
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        [self addGestureRecognizer:singleRecognizer];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer* doubleRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTap:)];
        doubleRecognizer.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleRecognizer];
        
        [singleRecognizer requireGestureRecognizerToFail:doubleRecognizer];
    }
    return _bgImageView;
}
-(void)singleTap1:(UITapGestureRecognizer*)recognizer
{
    
   DDLOG(@"单击操作");
    
}
-(void)doubleTap:(UITapGestureRecognizer*)recognizer
{
 DDLOG(@"双击操作");
    if (curScale == 1) {
        [self.scrollView setZoomScale:self.maxZoom animated:YES];
    }else{
        [self.scrollView setZoomScale:1.0 animated:YES];
    }
}

// 缩放时调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    // 可以实时监测缩放比例
    curScale = scrollView.zoomScale;
    if(scrollView.zoomScale<=1.0){
        self.bgImageView.center = _scrollView.center;
    }
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _scrollView.delegate = self;
        _scrollView.multipleTouchEnabled = YES;//打开多指触控
        _scrollView.maximumZoomScale = self.maxZoom;
        _scrollView.minimumZoomScale = self.minZoom;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = self.bounces;
    }
    return _scrollView;
}






@end
