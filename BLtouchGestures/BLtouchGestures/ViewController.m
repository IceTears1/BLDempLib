//
//  ViewController.m
//  BLtouchGestures
//
//  Created by 冰泪 on 2017/8/15.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"
#ifdef DEBUG

#define DDLOG(...) printf(" %s\n",[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DDLOG_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))

#else

#define DDLOG(...) ;
#define DDLOG_CURRENT_METHOD ;

#endif

#define longPressTime 1.0
#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)
#define radiansToDegrees(x) (180.0 * x / pi)

@interface ViewController ()
{
    double _lastDistance;
}
@property(nonatomic,assign)CGPoint startTouchPosition;
@property(nonatomic,assign)CGPoint startTwoTouchPosition;
@property(nonatomic,assign)NSTimeInterval startPressTime;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
#pragma mark- 单击方法
- (void)singleTouch:(id)sender {
    //对应单击时发生的事件
    DDLOG(@"此时是单击的操作");
}
#pragma mark- 双击方法
- (void)doubleTouch:(id)sender {
    //双击时对应发生的事件
    DDLOG(@"此时是双击的操作");
    

}
#pragma mark- 长按方法
- (void)longPress:(CGPoint)point {
    //对应单击时发生的事件
    DDLOG(@"此时是长按的操作");
}
#pragma mark- 旋转方法
- (void)rotating:(CGFloat)angle {
    //对应单击时发生的事件
    DDLOG(@"此时是旋转的操作");
}
#pragma mark- 拖拽
- (void)dragAndDrop:(CGPoint)point {
    //拖拽的事件
    DDLOG(@"拖拽的事件");
}
#pragma mark- 捏合缩放
- (void)Pinch:(CGFloat)ratio {
    //对应单击时发生的事件
    DDLOG(@"此时是捏合缩放的操作--  %f",ratio);
    
    
}

-(CGFloat)angleForLineOneStartPoint:(CGPoint)lineOneStartPoint lineTwoStartPoint:(CGPoint)lineTwoStartPoint lineOneEndPoint:(CGPoint)lineOneEndPoint lineTwoEndPoint:(CGPoint)lineTwoEndPoint{
    if (lineOneStartPoint.x>lineOneEndPoint.x) {
        CGPoint temp = lineOneStartPoint;
        lineOneStartPoint = lineOneEndPoint;
        lineOneEndPoint = temp;
    }
    if (lineTwoStartPoint.x>lineTwoEndPoint.x) {
        CGPoint temp = lineTwoStartPoint;
        lineOneStartPoint = lineTwoEndPoint;
        lineTwoEndPoint = temp;
    }
    
    //    DDLOG(@"%@--%@--%@--%@",NSStringFromCGPoint(lineOneStartPoint),NSStringFromCGPoint(lineOneEndPoint),NSStringFromCGPoint(lineTwoStartPoint),NSStringFromCGPoint(lineTwoEndPoint));
    
    
    CGFloat a = lineOneEndPoint.x - lineOneStartPoint.x;
    CGFloat b = lineOneEndPoint.y - lineOneStartPoint.y;
    CGFloat c = lineTwoEndPoint.x - lineTwoStartPoint.x;
    CGFloat d = lineTwoEndPoint.y - lineTwoStartPoint.y;
    
    CGFloat rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    
    if (lineOneStartPoint.y>lineOneEndPoint.y) {
        rads = -rads;
    }
    //    DDLOG(@"11111---  %f",radiansToDegrees(rads));
    return radiansToDegrees(rads);
}
//编写一个计算两点之间距离的方法，封装此方法，方便调用
- (double)distanceOfPoint:(CGPoint)point1 withPoint:(CGPoint)point2 {
    double num1 = pow(point1.x - point2.x, 2);
    double num2 = pow(point1.y - point2.y, 2);
    double distance = sqrt(num1 + num2);
    return distance;
    
}
#pragma mark--------触摸开始时调用此方法
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (event.allTouches.count == 1){
        UITouch *aTouch = [touches anyObject];
        // startTouchPosition是一个CGPoint类型的属性，用来存储当前touch事件的位置
        self.startTouchPosition = [aTouch locationInView:self.view];
        self.startPressTime = [aTouch timestamp];
        
    }else if (event.allTouches.count == 2) {
        NSArray *touchArray=[event.allTouches allObjects];
        UITouch *firstTouch=[touchArray objectAtIndex:0];
        UITouch *secondTouch=[touchArray objectAtIndex:1];
        CGPoint point1=[firstTouch locationInView:self.view];
        CGPoint point2=[secondTouch locationInView:self.view];
        //计算两点距离[(x1-x2)^2+(y1-y2)^2]开方
        double distance=[self distanceOfPoint:point1 withPoint:point2];
        //在手指刚触摸屏幕时给last distance赋值,防止在手指捏合时因为last distance为空,造成第一次相减差太大,图片放大比例太高
        _lastDistance=distance;
        //拿到初始的位置 用于计算旋转
        self.startTouchPosition = point1;
        self.startTwoTouchPosition = point2;
    }
}

#pragma mark----------触摸的移动（滑动）
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (event.allTouches.count == 1){
        UITouch *aTouch = [touches anyObject];
        CGPoint currentTouchPosition = [aTouch locationInView:self.view];
        //        DDLOG(@"开始位置 %@---结束位置 %@",NSStringFromCGPoint(self.startTouchPosition) ,NSStringFromCGPoint(currentTouchPosition));
        //拖拽的位置传入移动的坐标
        [self dragAndDrop:CGPointMake(currentTouchPosition.x-self.startTouchPosition.x, currentTouchPosition.y- self.startTouchPosition.y)];
        
    }else if (event.allTouches.count == 2){
        //        DDLOG(@"双指 捏合或者放大");
        NSArray * array = [event.allTouches allObjects];
        //分别取出两个touch对象
        UITouch * pTouch1 = [array objectAtIndex:0];
        UITouch * pTouch2 = [array objectAtIndex:1];
        //获取两个touch对象的坐标点
        CGPoint point1 = [pTouch1 locationInView:self.view];
        CGPoint point2 = [pTouch2 locationInView:self.view];
        //用封装的方法计算两触摸点之间的距离
        double distance = [self distanceOfPoint:point1 withPoint:point2];
        float times = 1;
        //        DDLOG(@"122222222------ %f----%f",_lastDistance,distance);
        //判断两点间距离的变化
        if ((distance - _lastDistance) > 0) {
            //两点距离增大的方法，一般为图片、文字等的放大，捏合
            int a=distance-_lastDistance;
            
            //计算放大倍数
            times=a/_lastDistance;
            //            DDLOG(@"两点距离变大-----%f",times);
        } else {
            //两点距离减小的方法，一般为图片、文字等的缩小，放开
            int a=distance-_lastDistance;
            //计算放大倍数
            times=a/_lastDistance;
            //            DDLOG(@"两点距离变小-----%f",times);
        }
        //调用捏合的方法
        [self Pinch:times];
        //把现在的距离赋值给原来的距离，覆盖之
        //        _lastDistance = distance;
        
        //计算旋转的角度
        CGFloat rads =  [self angleForLineOneStartPoint:self.startTouchPosition lineTwoStartPoint:point1 lineOneEndPoint:self.startTwoTouchPosition lineTwoEndPoint:point2];
        //调用旋转的方法
        [self rotating:rads];
    }
    
}

#pragma mark--------手离开屏幕，触摸事件结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //触摸结束时发生的事件
    if (event.allTouches.count == 1) {
        //获取任意一个touch对象
        UITouch * pTouch = [event.allTouches anyObject];
        //获取对象所在的坐标
        CGPoint point = [pTouch locationInView:self.view];
        //以字符的形式输出触摸点
        DDLOG(@"触摸点的坐标：%@",NSStringFromCGPoint(point));
        if ((pTouch.timestamp - self.startPressTime)>longPressTime) {
            //            DDLOG(@"按压开始时间：%f",self.startPressTime);
            //            DDLOG(@"按压时间：%f",pTouch.timestamp);
            //            [self performSelector:@selector(longPress:) withObject:nil afterDelay:0.2];
            [self longPress:point];
            return;
        }
        //获取触摸的次数
        NSUInteger tapCount = [pTouch tapCount];
        //对触摸次数判断
        if (tapCount == 1) {
            //在0.2秒内只触摸一次视为单击
            [self performSelector:@selector(singleTouch:) withObject:nil afterDelay:0.2];
            
        } else if(tapCount == 2) {
            //取消单击响应，若无此方法则双击看做是：单击事件和双击事件
            [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(singleTouch:) object:nil];
            //确定为双击事件
            [self doubleTouch:nil];
        }
    }else if (event.allTouches.count == 2){
        
    }
}
#pragma mark--------触摸事件被打断，比如电话打进来
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    //一般不写此方法，可以把程序挂起，放在后台处理
    DDLOG(@"取消");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
