//
//  GetuiBXSdK.h
//  GetuiBXSdK
//
//  Created by getui on 2020/8/5.
//  Copyright © 2020 ak. All rights reserved.
//
//  GetuiBXSdK-Version: 2.1.0.0

#import <Foundation/Foundation.h>

#if __has_include(<GetuiBXSdk/GetuiBXSdk.h>)
#import <GetuiBXSdk/GetuiBXSdkKey.h>
#import <GetuiBXSdk/GetuiBXAd.h>
#import <GetuiBXSdk/GetuiBXAdTouch.h>
#import <GetuiBXSdk/GetuiBXButton.h>
#import <GetuiBXSdk/GetuiBXCons.h>
#import <GetuiBXSdk/GetuiBXFloat.h>
#import <GetuiBXSdk/GetuiBXAdObject.h>
//标准广告
#import <GetuiBXSdk/GetuiBXParamObject.h>
#import <GetuiBXSdk/GetuiBXBanner.h>
#import <GetuiBXSdk/GetuiBXSplashAd.h>
#import <GetuiBXSdk/GetuiBXInterstitialAd.h>
#import <GetuiBXSdk/GetuiBXRewardVideoAd.h>
#import <GetuiBXSdk/GetuiBXNativeAd.h>
#import <GetuiBXSdk/GetuiBXDrawAd.h>
#else
#import "GetuiBXSdkKey.h"
#import "GetuiBXAd.h"
#import "GetuiBXAdTouch.h"
#import "GetuiBXButton.h"
#import "GetuiBXCons.h"
#import "GetuiBXFloat.h"
#import "GetuiBXAdObject.h"
//标准广告
#import "GetuiBXParamObject.h"
#import "GetuiBXBanner.h"
#import "GetuiBXSplashAd.h"
#import "GetuiBXInterstitialAd.h"
#import "GetuiBXRewardVideoAd.h"
#import "GetuiBXNativeAd.h"
#import "GetuiBXDrawAd.h"
#endif


@protocol GetuiBXSdkDelegate;

/** 个推变现SDK，
 *  官网地址：http://docs.getui.com/monetize/
 */
@interface GetuiBXSdk : NSObject

/** 初始化sdk
 *  @param GetuiBXSdkKey实例，登记第三方广告平台的appid和个推应用的appid
 *  @param delegate：个推SDK回调代理
 */
+ (void)startSdkWithKey:(GetuiBXSdkKey *)key delegate:(id<GetuiBXSdkDelegate>)delegate;

/**
 *  获取SDK版本号
 *
 *  当前版本, 当前文件头部(顶部)可见
 *  @return 版本值
 */
+ (NSString *)version;

/** 设置debug模式
 *  开启Debug模式，广告位配置`默认过期`，会实时向服务端请求当前的广告位配置。
 */
+ (void)setDebug;


@end

//MARK: - SDK Delegate

/** 初始化sdk的回调事件
 */
@protocol GetuiBXSdkDelegate <NSObject>

@optional

/**
 *  SDK遇到错误消息返回error
 *
 *  @param error SDK内部发生错误，通知第三方，返回错误
 */
- (void)GetuiBXSdkDidOccurError:(NSError *)error;
@end


/** 广告组件的回调事件
 */
@protocol GetuiBXComponentDelegate <NSObject>
@optional

/** 组件加载失败，比如没有集成对应的第三方广告sdk或者配置错误等
 *  @param component，发生事件的组件实例
 *  @param error，失败原因
 */
- (void)GetuiBXComponentInitFail:(NSObject *)component error:(NSError *)error;

/** 组件加载超时，比如配置的总时长太短等
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentTimeout:(NSObject *)component;

/** 组件加载成功
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdLoadSuccess:(NSObject *)component;

/** 组件展示成功
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdDidShow:(NSObject *)component ad:instance;

/** 组件展示失败
 *  @param component，发生事件的组件实例
 *  @param error，失败原因
 */
- (void)GetuiBXComponentAdFailShow:(NSObject *)component error:(NSError *)error;

/** 组件被点击
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdDidClick:(NSObject *)component ad:instance;

/** 组件关闭
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdDidClose:(NSObject *)component ad:instance;

/** 广告详情关闭
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdDidCloseDetail:(NSObject *)component ad:instance;

/** 广告点击跳过
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdDidClickSkip:(NSObject *)component ad:instance;

/** 激励视频生效
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdVideoEffective:(NSObject *)component ad:instance;

/** 视频播放完成
 *  @param component，发生事件的组件实例
 */
- (void)GetuiBXComponentAdVideoFinish:(NSObject *)component ad:instance;

@end
