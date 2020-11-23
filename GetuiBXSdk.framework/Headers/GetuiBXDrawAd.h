//
//  GetuiBXNativeAdPrivate.h
//  BXSDK
//
//  Created by lzy on 2020/8/24.
//  Copyright © 2020 ak. All rights reserved.
// 

@protocol GetuiBXComponentDelegate;

@class GetuiBXNativeAdView, GetuiBXNativeAdParams;

NS_ASSUME_NONNULL_BEGIN

@interface GetuiBXDrawAd : NSObject

@property(nonatomic, weak, nullable) id <GetuiBXComponentDelegate> gtDelegate;

@property(nonatomic, assign, readonly, getter=isAdValid) BOOL adValid;

@property(nonatomic, assign) CGSize adSize;

@property(nonatomic, strong) NSMutableArray<__kindof GetuiBXNativeAdView *> *adViews;

@property(nonatomic, weak) UIViewController *rootViewController;

- (instancetype)initWithAdId:(NSString *)adId params:(GetuiBXNativeAdParams *)params;

- (void)loadAdData;

@end

NS_ASSUME_NONNULL_END

