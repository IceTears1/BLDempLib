//
//  ViewController.m
//  ipad
//
//  Created by 冰泪 on 2017/7/12.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"
#import "CoverWindowsView.h"
//#import "UIViewController+AdapterIpad.h"

#import "BLTransitionAnimator.h"
#import "ONeViewController.h"
#import "FuYouSuccessVC.h"
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)



//#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UIPopoverPresentationControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    CoverWindowsView *vv;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(0, 0,DeviceMaxWidth, 30)];
    vv.tag = 1;
    [self.view addSubview:vv];
    if (isPad) {
        vv.backgroundColor = [UIColor blueColor];
    }
    
    if (isphone) {
         vv.backgroundColor = [UIColor yellowColor];
    }
    
    UIView *vv1 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, DeviceMaxWidth, 20)];
    vv1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:vv1];
    NSLog(@"2222231231313");
    
//    [self observerDeviceOrientation:@selector(aaa)];
  UIButton*green=[[UIButton alloc]initWithFrame:CGRectMake(100,100, 100, 100)];
    //设置背景色
    green.backgroundColor=[UIColor greenColor];
    //添加事件
    [green addTarget:self action:@selector(button:)forControlEvents:UIControlEventTouchUpInside];
    //将控件添加到main控制器的view上面
    [self.view addSubview:green];
    
    
    NSMutableArray *ary= [[NSMutableArray alloc]initWithCapacity:0];
    [ary addObject:@"1"];
    [ary addObject:@"2"];
    [ary addObject:@"3"];
    [ary addObject:@"4"];
    [ary addObject:@"5"];
    
    
    NSLog(@"%@",ary);
    
    NSString *str = ary[2];
    str = @"30";
    
    NSLog(@"%@",ary);
    
////    [ary removeObject:2];
//    [ary replaceObjectAtIndex:2 withObject:str];
    NSLog(@"%@",ary);
    
    
}
-(void)button:(UIButton*)green {
    
//    if (!vv) {
//        vv = [[CoverWindowsView alloc]initWithFrame:CGRectMake(0, 0, DeviceMaxWidth, DeviceMaxHeight)];
//        [self.view addSubview:vv];
//    }
//    ONeViewController *vc = [[ONeViewController alloc]init];
//    [self bl_presentViewController:vc AnimatorStyle:BLTransitionAnimatorLeft animated:YES];
    
    FuYouSuccessVC *vv1 = [[FuYouSuccessVC alloc]init];
    [self.navigationController pushViewController:vv1 animated:YES];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(NSString *)kUTTypeImage]) {
//        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
//        [self performSelector:@selector(saveImage:) withObject:img afterDelay:0.5];
//    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
    //实现代理方法
//-(UIModalPresentationStyle) adaptivePresentationStyleForPresentationController:(UIPresentationController*)controller{
//    //返回UIModalPresentationNone为不匹配
//    return UIModalPresentationNone;
//}
//    


-(void)deviceOrientationDidChange{
    [super deviceOrientationDidChange];
    self.myimg.image = [UIImage imageNamed:[self formatImgPath:@"aaa.jpg"]];
    
    if(self.isPadPortrait){
        self.myimg.image = [UIImage imageNamed:@"111.jpg"];
    }else{
        self.myimg.image = [UIImage imageNamed:@"222.jpg"];
    }
}
//-(void)deviceOrientationDidChange{
//    [super deviceOrientationDidChange];
//}
//- (void)deviceOrientationDidChange
//{
//    NSLog(@"deviceOrientationDidChange:%ld",(long)[UIDevice currentDevice].orientation);
//    
//    NSLog(@"111----H:%f   w:%f",SCREEN_HEIGHT,SCREEN_WIDTH);
    //    if([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait) {
////        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait];
////        [self orientationChange:NO];
//        //注意： UIDeviceOrientationLandscapeLeft 与 UIInterfaceOrientationLandscapeRight
//        
//    } else if ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft) {
////        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight];
////        [self orientationChange:YES];
//        
//    }
//}

//- (void)orientationChange:(BOOL)landscapeRight
//{
//    if (landscapeRight) {
//        [UIView animateWithDuration:0.2f animations:^{
//            self.view.transform = CGAffineTransformMakeRotation(M_PI_2);
//            self.view.bounds = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        }];
//    } else {
//        [UIView animateWithDuration:0.2f animations:^{
//            self.view.transform = CGAffineTransformMakeRotation(0);
//            self.view.bounds = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        }];
//    }
//}
// 用到的两个宏：


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
