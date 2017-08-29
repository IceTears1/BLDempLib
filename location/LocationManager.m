//
//  LocationManager.m
//  SportSocial
//
//  Created by wings on 15/10/26.
//  Copyright © 2015年 cloudrui. All rights reserved.
//

#import "LocationManager.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface LocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong)CLLocationManager *locationManager;


@end

@implementation LocationManager

+ (instancetype)shared {
    static LocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[LocationManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    self = [super init];
    self.locationManager = [[CLLocationManager alloc] init];
    //定位的频率,每隔300米需要重新定位
    self.locationManager.distanceFilter = 1000;
    //设置定位的精确度,精确度越高,越费电
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    if(IS_OS_8_OR_LATER){
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            }else if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationAlwaysUsageDescription"]){
                [self.locationManager requestAlwaysAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    }
    [self.locationManager startUpdatingLocation];
    
    return self;
}

- (BOOL)hasGpsRight {
    NSUInteger code = [CLLocationManager authorizationStatus];
    BOOL hasRight = (code == kCLAuthorizationStatusAuthorizedWhenInUse) || (code == kCLAuthorizationStatusAuthorizedAlways);
    return hasRight;
}


#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{

    self.userLocation = newLocation;
//    NSLog(@"%f",self.userLocation.coordinate.longitude);
//    NSLog(@"%f",self.userLocation.coordinate.latitude);
    __weak typeof (self)weakSelf = self;
    CLLocation *loc = [[CLLocation alloc]initWithLatitude:self.userLocation.coordinate.latitude longitude:self.userLocation.coordinate.longitude];
    //创建地理位置(反编码的对象)
    CLGeocoder *geocode = [[CLGeocoder alloc]init];
    //进行反编码,第一个参数是要编码的地址,第二个参数是编码后的结果
    [geocode reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"%@",error.localizedDescription);
            [weakSelf.locationManager startUpdatingLocation];
        }else{
            //反编码后有结果
            if (placemarks.count > 0) {
                CLPlacemark *mark = placemarks[0];
                NSString *country = mark.country;
                NSString *city = mark.locality;
                NSString *subCity = mark.subLocality;
                NSString *street = mark.thoroughfare;
                NSString *name = mark.name;
                NSString *address = [NSString stringWithFormat:@"country:%@,city:%@,subCity:%@,street%@,name:%@",country,city,subCity,street,name];
                NSLog(@"%@",city);
                weakSelf.city = city;
                weakSelf.country = country;
                [[NSNotificationCenter defaultCenter]postNotificationName:@"DINGWEICHENGGONG" object:nil];
//                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//                [userDefaults setObject:country forKey:@"country"];
//                [userDefaults setObject:city forKey:@"city"];
//                [userDefaults synchronize];
                
                
                
            }
        }
    }];
    
}

@end
