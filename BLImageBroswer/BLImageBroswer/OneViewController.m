//
//  OneViewController.m
//  BLImageBroswer
//
//  Created by 冰泪 on 2017/8/9.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "OneViewController.h"


@interface OneViewController ()


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initaaa];
}
- (void)initaaa{
    for (NSInteger i= 0; i<20; i++) {
        [self bbb:i];
    }
}
- (void)bbb:(NSInteger)a{
    if (self.myBlock) {
        self.myBlock(a);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
