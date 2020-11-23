//
//  GetuiBXSplashAd.h
//  BXSDK
//
//  Created by ak on 2020/8/17.
//  Copyright © 2020 ak. All rights reserved.
//  标准广告

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class GetuiBXParamObject;
@protocol GetuiBXComponentDelegate;

/** 开屏广告
 */
@interface GetuiBXSplashAd : NSObject

/** 事件回调
 */
@property(nonatomic, weak) id <GetuiBXComponentDelegate> gtDelegate;

/**
 */
@property(nonatomic, assign, getter=isAdValid) BOOL adValid;

/** 初始化开屏广告
 * @param adId： 个推广告位Id
 * @param keyWindow: 当前keywindow
 * @param param：参数实例
 */
- (instancetype)initWithAdId:(NSString *)adId container:(UIWindow *)keyWindow param:(GetuiBXParamObject *)param;


/** 加载广告
 */
- (void)loadAdData;

/**
 *  （应用启动时）加载成功后，展示开屏广告
 */
- (void)showAd;

@end

NS_ASSUME_NONNULL_END
