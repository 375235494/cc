//
//  HMServiceTool.m
//  HUAMAO
//
//  Created by imac-xdc on 2017/5/18.
//  Copyright © 2017年 陈臣. All rights reserved.
//

#import "HMServiceTool.h"

#import "HMOverdueShowView.h"

@implementation HMServiceTool

+(void)HMPostPath :(NSString *)pathurl  parameters:(NSDictionary *)parameter success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];

    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    manager.requestSerializer.timeoutInterval = RequestTimeOUT;
    
    [manager POST:pathurl parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSNumber * loginBool = responseObject[@"login"];
        
        if(loginBool.integerValue == 1){
            
            [MBProgressHUD hideHUD];
            
            [[[HMOverdueShowView alloc]init]OverdueShow];  return;
            
            
        }
   
        successBlock(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(task,error);
    }];
    
}


+(void)HMGETPath :(NSString *)pathurl  parameters :(NSDictionary *)dic  success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock
{

    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    

    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = RequestTimeOUT;
    
    [manager GET:pathurl  parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSNumber * loginBool = responseObject[@"login"];
        
        if(loginBool.integerValue == 1){
            
            [MBProgressHUD hideHUD];
            
            [[[HMOverdueShowView alloc]init]OverdueShow];  return;
            
            
        }

        successBlock(task,responseObject);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        failureBlock(task,error);
  
    }];

}







+(void)RequestWithDic:(NSDictionary *)dic type:(URLtype)type RequestType:(Requesttype) Requesttype success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock{
    
    NSString *strUrl = [NSString convertToJSONData:dic];
    
    NSString *urlHM;
    
    if(type == URLtypeAPP){
        
        urlHM = HMPATUrl;
        
    }else{
        
        urlHM = HMPATUrlUSER;
        
    }
    
    NSString *HMUrl = [NSString stringWithFormat:@"%@?json=%@",urlHM,strUrl];
    
    NSLog(@"%@",HMUrl);
    
    HMUrl = [HMUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    if(Requesttype == RequesttypeGet){
        
        [self HMGETPath:HMUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            successBlock(task,responseObject);;
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            
            failureBlock(task,error);
            
        }];
        
    }else if(Requesttype == RequesttypePost){
        
        
        [self HMPostPath:HMUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            successBlock(task,responseObject);;
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            
            failureBlock(task,error);
            
        }];
        
    }

}



+(void)RequestWithNotaboutboxDic:(NSDictionary *)dic type:(URLtype)type RequestType:(Requesttype) Requesttype success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock {
    
    NSString *strUrl = [NSString convertToJSONData:dic];
    
    NSString *urlHM;
    
    if(type == URLtypeAPP){
        
        urlHM = HMPATUrl;
        
    }else{
        
        urlHM = HMPATUrlUSER;
        
    }
    
    NSString *HMUrl = [NSString stringWithFormat:@"%@?json=%@",urlHM,strUrl];
    
    NSLog(@"%@",HMUrl);
    
    HMUrl = [HMUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if(Requesttype == RequesttypeGet){
        
        [self HMGETNotaboutboxPath:HMUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            successBlock(task,responseObject);;
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            
            failureBlock(task,error);
            
        }];
        
    }else if(Requesttype == RequesttypePost){
        
        
        [self HMPostNotaboutboxPath:HMUrl parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
            
            successBlock(task,responseObject);;
            
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            
            failureBlock(task,error);
            
        }];
        
    }
    
}


+(void)HMPostNotaboutboxPath :(NSString *)pathurl  parameters:(NSDictionary *)parameter success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    manager.requestSerializer.timeoutInterval = RequestTimeOUT;
    
    [manager POST:pathurl parameters:parameter progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        

        successBlock(task,responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(task,error);
    }];
    
}


+(void)HMGETNotaboutboxPath :(NSString *)pathurl  parameters :(NSDictionary *)dic  success:(void(^)(NSURLSessionDataTask *operation, id responseObject))successBlock  failure :(void(^)(NSURLSessionDataTask *operation, NSError *error))failureBlock
{
    
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    manager.requestSerializer.timeoutInterval = RequestTimeOUT;
    
    [manager GET:pathurl  parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        
  
        successBlock(task,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock(task,error);
        
    }];
    
}

@end
