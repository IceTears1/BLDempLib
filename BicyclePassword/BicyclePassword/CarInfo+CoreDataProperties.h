//
//  CarInfo+CoreDataProperties.h
//  
//
//  Created by 冰泪 on 17/1/6.
//
//  This file was automatically generated and should not be edited.
//

#import "CarInfo+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface CarInfo (CoreDataProperties)

+ (NSFetchRequest<CarInfo *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *number;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSDate *time;

@end

NS_ASSUME_NONNULL_END
