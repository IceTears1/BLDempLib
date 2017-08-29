//
//  ViewController.m
//  BicyclePassword
//
//  Created by 冰泪 on 17/1/6.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"
#import "CarInfo+CoreDataClass.h"

@interface ViewController ()
{
    NSMutableArray *mAry;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//- (IBAction)add:(id)sender {
//    for (int i = 0; i<mAry.count; i++) {
//        
//        //查询有重复的  先删掉
//        NSArray *ary = [Person MR_findByAttribute:@"name" withValue:mAry[i]];
//        if (ary.count>0) {
//            for (CarInfo *carInfo in ary) {
//                [carInfo MR_deleteEntity];
//            }
//        }
//        
//        //重新保存新数据
//        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
//            Person *person = [Person MR_createEntityInContext:localContext];
//            person.name = mAry[i];
//            person.birthday = [NSString stringWithFormat:@"200%d",i];
//            person.age =[NSString stringWithFormat:@"11%d",i];
//            
//            
//        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
//            NSLog(@"保存成功");
//        }];
//        
//    }
//    
//    
//    
//}
////删除
//- (IBAction)delete1:(id)sender {
//    NSArray *personArr = [Person MR_findAll];
//    for (Person *person in personArr) {
//        if ([person.name isEqualToString:@"张1"]) {//删除 名字为张1 的行
//            [person MR_deleteEntity];
//        }
//        
//    }
//    
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//}
//- (IBAction)change:(id)sender {
//    
//    NSArray *ary = [Person MR_findAll];
//    for(Person *person in ary){
//        
//        if ([person.name isEqualToString:@"张5"]) { //将名字叫张5的  改名叫王6
//            person.name = @"王6";
//            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//            
//        }
//        
//    }
//    
//    
//}

//
//- (IBAction)select:(id)sender {
//    
    //    // 查找数据库中的所有数据
    //    NSArray *ary = [Person MR_findAll];
    
    
    // 查找所有的Person并按照Name排序
    //    NSArray *ary = [Person MR_findAllSortedBy:@"name" ascending:YES];
    //    for(Person *person in ary){
    //        NSLog(@"Name:%@----名字--%@", person.name, person.age);
    //    }
    //    // 查找所有的Person并按照firstName排序
    //    NSArray *personSorted = [Person MR_findAllSortedBy:@"name" ascending:YES];
    //    // 查找所有的age属性为25的Person记录
    //    NSArray *personAgeEqual25 = [Person MR_findByAttribute:@"age" withValue:[NSNumber numberWithInt:25]];
    //    // 查找数据库中的第一条记录
    //    Person *personFirst = [Person MR_findFirst];
    
    // 查找数据库中的第一条记录的全名
    //    personFirst = [Person MR_findFirst];
    //    NSLog(@"personName:%@------%@", personFirst.name, personFirst.age);
    //    NSPredicate *p = [NSPredicate predicateWithFormat:@"name = '张5' && age = '114'"];
    
//    NSPredicate *p= [NSPredicate predicateWithFormat:@"name LIKE '*1' OR name LIKE '*3' "];
//    NSLog(@"111---%@",p);
//    NSArray *ary = [Person MR_findAllWithPredicate:p];
//    for(Person *person in ary){
//        NSLog(@"Name:%@----名字--%@", person.name, person.age);
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
