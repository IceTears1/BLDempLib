//
//  FuYouSuccessVC.h
//  ipad
//
//  Created by 冰泪 on 2017/8/22.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, FuYouSuccessType) {
    FuYouRecharge = 0,
    FuYouWithDraw

};
@interface FuYouSuccessVC : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (weak, nonatomic) IBOutlet UIButton *subButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewTop;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewHight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgViewWidth;

- (IBAction)backAccountEvent:(UIButton *)sender;
@property (nonatomic, assign)FuYouSuccessType type;
@end
