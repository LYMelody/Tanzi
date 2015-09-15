//
//  WXDataService.h
//  WXWeibo
//
//  Created by JayWon on 14-8-23.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^CompletionLoad)(NSObject *result);

@interface WXDataService : NSObject


//演示抓包：AFNetworking
+ (AFHTTPRequestOperation *)requestWithURL:(NSString *)url
                                    params:(NSMutableDictionary *)params
                                httpMethod:(NSString *)httpMethod
                                     block:(CompletionLoad)block
                             requestHeader:(NSDictionary *)header;

//演示抓包：系统自带类库
+ (NSMutableURLRequest *)requestWithURL:(NSString *)url
                                 params:(NSMutableDictionary *)params
                          requestHeader:(NSDictionary *)header
                             httpMethod:(NSString *)httpMethod
                                  block:(CompletionLoad)block;

@end
