//
//  HMServiceTool.h
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFHTTPSessionManager.h"

@interface HMServiceTool : NSObject


+(void)HMPostPath :(NSString *)pathurl  parameters:(NSDictionary *)parameter success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock;


+(void)HMGETPath :(NSString *)pathurl  parameters :(NSDictionary *)dic  success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock;


+(void)RequestWithDic:(NSDictionary *)dic type:(URLtype)type RequestType:(Requesttype) Requesttype success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock;


+(void)RequestWithNotaboutboxDic:(NSDictionary *)dic type:(URLtype)type RequestType:(Requesttype) Requesttype success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock;
@end
