//
//  FuYouSuccessVC.m
//  ipad
//
//  Created by 冰泪 on 2017/8/22.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "FuYouSuccessVC.h"

@interface FuYouSuccessVC ()

@end

@implementation FuYouSuccessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.subButton.layer.cornerRadius = 4;
    [self.subButton setTitle:@"返回个人账户" forState:UIControlStateNormal];
    if(true){
        //是ipad
        self.imgViewTop.constant = 100;
        self.labelWidth.constant = 400;
        self.imgViewHight.constant = 200;
        self.imgViewWidth.constant = 200;
    }
    if (self.type == FuYouRecharge) {
        //充值
        self.imgView.image  = [UIImage imageNamed:@"ic_chongzhi_success"];
        self.tipsLabel.text = [NSString stringWithFormat:@"充值%.2f元成功！",11111.0];
        
    }else{
        //体现
        self.imgView.image  = [UIImage imageNamed:@"ic_tixian_success"];
        self.tipsLabel.text = [NSString stringWithFormat:@"您体现%.2f元已经成功,将在1~2个工作日内返回您绑定的银行卡中，请注意查收！",111111.0];
    }
}
- (IBAction)backAccountEvent:(UIButton *)sender {
    
}

- (instancetype)init
{

    return [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FuYouSuccessVC"];;
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
