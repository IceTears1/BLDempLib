//
//  BLDIYHeader.m
//  Refresh
//
//  Created by 冰泪 on 16/11/17.
//  Copyright © 2016年 冰泪. All rights reserved.
//

#import "BLDIYHeader.h"
#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)
#define HIGHT 55  //刷新view 的高
#define LeftWidth 30 //掉落元宝距离左边的边距
@interface BLDIYHeader()
{
    CGFloat last_X;
}
@property (strong, nonatomic) UIImageView *BgImgView;

@property (strong, nonatomic) UIView *leftView;
@property (strong, nonatomic) UIView *rightView;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSArray *ary;

@end

@implementation BLDIYHeader

-(UIImageView *)BgImgView{
    if (!_BgImgView) {
        _BgImgView = [[UIImageView alloc]initWithFrame:CGRectMake((DeviceMaxWidth -130)/2, HIGHT-50, 130, 50)];
        _BgImgView.image = [UIImage imageNamed:@"pic_loading@2x"];
        [self addSubview:_BgImgView];
    }
    return _BgImgView;
}
-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc]initWithFrame:CGRectMake(LeftWidth, 0,(DeviceMaxWidth - LeftWidth*2), HIGHT)];
        [self addSubview:_leftView];
        _leftView.clipsToBounds = YES;
    }
    return _leftView;
}

- (void)prepare
{
    [super prepare];
    // 设置控件的高度
    self.mj_h = HIGHT;
    self.backgroundColor = [UIColor clearColor];
    self.BgImgView.backgroundColor = [UIColor clearColor];
    //    self.leftView.backgroundColor = [UIColor greenColor];
}
-(void)dealloc {
    [_timer invalidate];
}
-(void)bl_startRefresh{
//    NSLog(@"开始刷新动画");
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    }
    //启动定时器
    _timer.fireDate = [NSDate distantPast];
    
}
-(void)bl_endRefresh{
//    NSLog(@"结束刷新");
    //停止定时器
    _timer.fireDate = [NSDate distantFuture];
}
-(void)onTimer
{
    _ary = @[@"ic_yuanbao@2x",@"ic_yuanbao_one@2x",@"ic_yuanbao_two@2x"];
    NSInteger i;
    i = arc4random()%_ary.count;
    UIImageView *leftImgV;
    leftImgV=[[UIImageView alloc]init];
    [leftImgV setImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@", _ary[i]]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //随机位置并且前后2个 间距不小于50
    NSInteger x;
    do {
        x = arc4random()%((int)self.leftView.frame.size.width-16);
    } while (fabs(x-last_X)<50);
    leftImgV.frame=CGRectMake(x, -10, 16, 10);
    last_X = x;
    [self.leftView addSubview:leftImgV];
    
    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(leftImgV)];
    [UIView setAnimationDuration:1];
    //    leftImgV.frame=CGRectMake(arc4random()%((int)self.leftView.frame.size.width), 50, 16, 10);
    leftImgV.frame=CGRectMake(leftImgV.frame.origin.x, 50, 16, 10);
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
    
}
-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    UIImageView *imgV=(__bridge UIImageView *)context;
    [imgV removeFromSuperview];
}
#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            // [self.loading stopAnimating];
            //self.showlabel.text = @"下拉刷新";
            [self bl_endRefresh];
            break;
        case MJRefreshStatePulling:
            // self.showlabel.text = @"放开开始刷新";
            [self bl_startRefresh];
            break;
        case MJRefreshStateWillRefresh:
            
            break;
        case MJRefreshStateRefreshing:
            //[self.loading startAnimating];
            [self bl_startRefresh];
            break;
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
    //    CGFloat red = 1.0 - pullingPercent * 0.5;
    //    CGFloat green = 0.5 - 0.5 * pullingPercent;
    //    CGFloat blue = 0.5 * pullingPercent;
    //    self.label.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
