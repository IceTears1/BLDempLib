//
//  OneViewController.h
//  BLImageBroswer
//
//  Created by 冰泪 on 2017/8/9.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^textBLocck)(NSInteger a);


@interface OneViewController : UIViewController

@property(nonatomic,weak)textBLocck myBlock;
@end
