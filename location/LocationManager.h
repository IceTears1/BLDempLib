//
//  LocationManager.h
//  SportSocial
//
//  Created by wings on 15/10/26.
//  Copyright © 2015年 cloudrui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h> 
#import <UIKit/UIKit.h>


@interface LocationManager : NSObject

@property (nonatomic, strong)CLLocation* userLocation;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
- (BOOL) hasGpsRight;

+ (instancetype)shared;

@end
