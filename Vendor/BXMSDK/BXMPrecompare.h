//
//  BXMPrecompare.h
//  BXMSDK
//
//  Created by weicai on 2020/8/7.
//  Copyright © 2020 Mac. All rights reserved.
//

#ifndef BXMPrecompare_h
#define BXMPrecompare_h


#pragma mark ---------穿山甲预编译

#ifdef __has_include

#if __has_include(<BUAdSDK/BUSplashAdView.h>) && __has_include(<BUAdSDK/BUAdSDKManager.h>) &&  __has_include(<BUAdSDK/BUNativeExpressInterstitialAd.h>) && __has_include(<BUAdSDK/BUNativeExpressFullscreenVideoAd.h>)  &&  __has_include(<BUAdSDK/BURewardedVideoModel.h>) && __has_include(<BUAdSDK/BUNativeExpressRewardedVideoAd.h>)  &&  __has_include(<BUAdSDK/BUNativeExpressBannerView.h>) && __has_include(<BUAdSDK/BUNativeExpressAdManager.h>)  &&  __has_include(<BUAdSDK/BUNativeExpressAdView.h>) && __has_include(<BUAdSDK/BUNativeAdsManager.h>) && __has_include(<BUAdSDK/BUNativeAdRelatedView.h>) && __has_include(<BUAdSDK/BUNativeExpressAdView.h>) && __has_include(<BUAdSDK/BUNativeAdsManager.h>) && __has_include(<BUAdSDK/BUNativeAdRelatedView.h>)

#define BXM_CSJCLASS_EXIST  1

#import <BUAdSDK/BUSplashAdView.h>
#import <BUAdSDK/BUAdSDKManager.h>
#import <BUAdSDK/BUNativeExpressInterstitialAd.h>
#import <BUAdSDK/BUNativeExpressFullscreenVideoAd.h>
#import <BUAdSDK/BURewardedVideoModel.h>
#import <BUAdSDK/BUNativeExpressRewardedVideoAd.h>
#import <BUAdSDK/BUNativeExpressBannerView.h>
#import <BUAdSDK/BUNativeExpressAdManager.h>
#import <BUAdSDK/BUNativeExpressAdView.h>
#import <BUAdSDK/BUNativeAdsManager.h>
#import <BUAdSDK/BUNativeAdRelatedView.h>


#else

#define BXM_CSJCLASS_EXIST 0

#endif

#pragma mark ---------广点通预编译
#if __has_include("GDTSDKConfig.h") && __has_include("GDTSplashAd.h") && __has_include("GDTUnifiedInterstitialAd.h") && __has_include("GDTRewardVideoAd.h") && __has_include("GDTUnifiedBannerView.h") && __has_include("GDTNativeExpressAd.h") && __has_include("GDTNativeExpressAdView.h") && __has_include("GDTUnifiedNativeAd.h") && __has_include("GDTUnifiedNativeAdView.h")

#define BXM_GDTCLASS_EXIST  1
#import "GDTSDKConfig.h"
#import "GDTSplashAd.h"
#import "GDTUnifiedInterstitialAd.h"
#import "GDTRewardVideoAd.h"
#import "GDTUnifiedBannerView.h"
#import "GDTNativeExpressAd.h"
#import "GDTNativeExpressAdView.h"
#import "GDTUnifiedNativeAd.h"
#import "GDTUnifiedNativeAdView.h"

#else

#define BXM_GDTCLASS_EXIST   0

#endif


#endif



#endif /* BXMPrecompare_h */
