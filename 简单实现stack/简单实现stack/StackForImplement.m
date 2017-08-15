//
//  StackForImplement.m
//  简单实现stack
//
//  Created by 冰泪 on 2017/2/14.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "StackForImplement.h"

// StackForImplement.m
@interface StackForImplement ()
// 存储栈数据
@property (nonatomic, strong) NSMutableArray *stackArray;
@end

@implementation StackForImplement

- (void)push:(id)obj {
    [self.stackArray addObject:obj];
}

- (id)popObj {
    if ([self isEmpty]) {
        return nil;
    } else {
        return self.stackArray.lastObject;
    }
}

- (BOOL)isEmpty {
    return !self.stackArray.count;
}

- (NSInteger)stackLength {
    return self.stackArray.count;
}

-(void)enumerateObjectsFromBottom:(StackBlock)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block ? block(obj) : nil;
    }];
}

-(void)enumerateObjectsFromtop:(StackBlock)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block ? block(obj) : nil;
    }];
}

-(void)enumerateObjectsPopStack:(StackBlock)block {
    __weak typeof(self) weakSelf = self;
    NSUInteger count = self.stackArray.count;
    for (NSUInteger i = count; i > 0; i --) {
        if (block) {
            block(weakSelf.stackArray.lastObject);
            [self.stackArray removeLastObject];
        }
    }
}

-(void)removeAllObjects {
    [self.stackArray removeAllObjects];
}

-(id)topObj {
    if ([self isEmpty]) {
        return nil;
    } else {
        return self.stackArray.lastObject;
    }
}

- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}
@end
