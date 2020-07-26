//
//  AdManager.m
//
//  Created by ivan zhang on 2019/12/3.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

#import <BUAdSDK/BUAdSDKManager.h>
#import <BUAdSDK/BURewardedVideoModel.h>
#import "BUAdSDK/BUSplashAdView.h"
#include "AdBoss.h"


@interface AdManager : RCTEventEmitter <RCTBridgeModule>
{
    
}
@end

@implementation AdManager

RCT_EXPORT_MODULE();


+ (BOOL)requiresMainQueueSetup {
    return YES;
}


- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


- (NSArray<NSString *> *)supportedEvents {
    return @[];
}

RCT_EXPORT_METHOD(init:(NSDictionary *)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    
    NSString  *appid = options[@"appid"];
    NSLog(@"AdManager feed init appid %@",appid);
    
    if(appid == nil) {
        reject(@"",@"AdManager init appid 未提供",nil);
        return;
    }
    
    //穿山甲 init appid
    [AdBoss init: appid];
    resolve(@"OK");
}


RCT_EXPORT_METHOD(loadFeedAd:(NSDictionary *)options resolve:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)
{
    
    NSString  *codeid = options[@"codeid"];
    if(codeid == nil) {
        reject(@"", @"loadFeedAd codeid 未提供", nil);
        return;
    }
    
    resolve(@"TODO: 还未实现是否需要给ios提前预加载 Feed Ad，这里同步的安卓的RN方法 ...");
}

@end



