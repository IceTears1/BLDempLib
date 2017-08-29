//
//  CarInfo+CoreDataProperties.m
//  
//
//  Created by 冰泪 on 17/1/6.
//
//  This file was automatically generated and should not be edited.
//

#import "CarInfo+CoreDataProperties.h"

@implementation CarInfo (CoreDataProperties)

+ (NSFetchRequest<CarInfo *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CarInfo"];
}

@dynamic number;
@dynamic password;
@dynamic time;

@end
