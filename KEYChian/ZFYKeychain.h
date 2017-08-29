//
//  ZFYKeychain.h
//  iceTearsTest
//
//  Created by 张飞跃 on 16/5/17.
//  Copyright © 2016年 张飞跃. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFYKeychain : NSObject

/**
 *    @brief    存储密码
 *
 *    @param     password     密码内容
 *
 *    @param     key     键
 */
+(void)savePassWord:(NSString *)password forKey:(NSString *)key;

/**
 *    @brief    读取密码
 *
 *    @return    密码内容
 *
 *    @param     key     键
 */
+(id)readPassWordObjectForKey:(NSString *)key;

/**
 *    @brief    删除密码数据
 *
 *    @param     key     键
 */
+(void)deletePassWordObjectForKey:(NSString *)key;

@end
