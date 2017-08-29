//
//  ZFYKeychain.m
//  iceTearsTest
//
//  Created by 张飞跃 on 16/5/17.
//  Copyright © 2016年 张飞跃. All rights reserved.
//

#import "ZFYKeychain.h"

@implementation ZFYKeychain

static NSString * const KEY_IN_KEYCHAIN = @"com.ZFYKeychain";//key 用来作为存取的标示


+(void)savePassWord:(NSString *)password forKey:(NSString *)key
{
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:password forKey:key];
    [self save:KEY_IN_KEYCHAIN data:usernamepasswordKVPairs];
}

+(id)readPassWordObjectForKey:(NSString *)key
{
    NSMutableDictionary *usernamepasswordKVPair = (NSMutableDictionary *)[self load:KEY_IN_KEYCHAIN];
    return [usernamepasswordKVPair objectForKey:key];
}

+(void)deletePassWordObjectForKey:(NSString *)key
{
    [self delete:key];
}

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,
            service, (__bridge_transfer id)kSecAttrService,
            service, (__bridge_transfer id)kSecAttrAccount,
            (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,
            nil];
}

+ (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
}

+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    return ret;
}

+ (void)delete:(NSString *)service {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
}
@end
