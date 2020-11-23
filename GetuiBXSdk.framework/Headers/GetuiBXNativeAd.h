//
//  GetuiNativeAd.h
//  BXSDK
//
//  Created by ak on 2020/8/17.
//  Copyright © 2020 ak. All rights reserved.
//  标准广告

#import <Foundation/Foundation.h>

@protocol GetuiBXComponentDelegate;

NS_ASSUME_NONNULL_BEGIN


@interface GetuiBXNativeAdParams : GetuiBXParamObject

@property(nonatomic, weak) UIViewController *viewController;

@property(nonatomic, assign) CGSize adSize;

@end


@interface GetuiBXNativeAdView : UIView

@property(nonatomic, weak, readonly) UIViewController *viewController;

- (BOOL)render;

@end


@interface GetuiBXNativeAd : NSObject

@property(nonatomic, weak, nullable) id <GetuiBXComponentDelegate> gtDelegate;

@property(nonatomic, assign, readonly, getter=isAdValid) BOOL adValid;

@property(nonatomic, strong, readonly) NSArray<GetuiBXNativeAdView *> *adViews;

@property(nonatomic, weak) UIViewController *rootViewController;

- (instancetype)initWithAdId:(NSString *)adId params:(GetuiBXNativeAdParams *)params;

- (void)loadAdData;
@end
 

NS_ASSUME_NONNULL_END
