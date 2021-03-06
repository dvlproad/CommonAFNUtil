//
//  TestNetworkClient+TestCache.m
//  CJNetworkDemo
//
//  Created by ciyouzen on 2016/12/20.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import "TestNetworkClient+TestCache.h"
#import "CJNetworkCacheUtil.h"

@implementation TestNetworkClient (TestCache)

/// 删除缓存
- (BOOL)removeCacheForEndWithCacheIfExistApi {
    NSString *apiSuffix = @"/api/testCache";
    NSDictionary *params = @{@"test": @"test"};
    
    NSString *Url = [self.baseUrl stringByAppendingString:apiSuffix];
    
    return [CJNetworkCacheUtil removeCacheForUrl:Url params:params];
}

/// 测试缓存时间
- (void)testEndWithCacheIfExistWithSuccess:(void (^)(CJResponseModel *responseModel))success
                                   failure:(void (^)(BOOL isRequestFailure, NSString *errorMessage))failure
{
    NSString *apiSuffix = @"/api/testCache";
    NSDictionary *params = @{@"test": @"test"};
    
    CJRequestSettingModel *settingModel = [[CJRequestSettingModel alloc] init];
    
    CJRequestCacheSettingModel *requestCacheModel = [[CJRequestCacheSettingModel alloc] init];
    requestCacheModel.cacheStrategy = CJRequestCacheStrategyEndWithCacheIfExist;
    requestCacheModel.cacheTimeInterval = 10;
    settingModel.requestCacheModel = requestCacheModel;
    
    settingModel.logType = CJRequestLogTypeConsoleLog;
    
    [self simulate2_postApi:apiSuffix params:params settingModel:settingModel success:success failure:failure];
}

/// 测试无缓存
- (void)testNoneCacheWithSuccess:(void (^)(CJResponseModel *responseModel))success
                         failure:(void (^)(BOOL isRequestFailure, NSString *errorMessage))failure
{
    NSString *apiSuffix = @"/api/testCache";
    NSDictionary *params = nil;
    
    CJRequestSettingModel *settingModel = [[CJRequestSettingModel alloc] init];
    
    CJRequestCacheSettingModel *requestCacheModel = [[CJRequestCacheSettingModel alloc] init];
    requestCacheModel.cacheStrategy = CJRequestCacheStrategyNoneCache;
//    requestCacheModel.cacheTimeInterval = 10;
    settingModel.requestCacheModel = requestCacheModel;
    
    settingModel.logType = CJRequestLogTypeConsoleLog;
    
    [self simulate2_postApi:apiSuffix params:params settingModel:settingModel success:success failure:failure];
}

@end
