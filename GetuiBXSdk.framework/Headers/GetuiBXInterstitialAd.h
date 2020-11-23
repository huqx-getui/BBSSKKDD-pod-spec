//
//  GetuiBXInterstitialAd.h
//  BXSDK
//
//  Created by ak on 2020/8/17.
//  Copyright © 2020 ak. All rights reserved.
//  标准广告

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol GetuiBXComponentDelegate;

@interface GetuiBXInterstitialAd : NSObject

@property(nonatomic, weak) id <GetuiBXComponentDelegate> gtDelegate;

- (instancetype)initWithAdId:(NSString *)adId adSize:(CGSize)adSize params:(GetuiBXParamObject *)params;

- (void)loadAdData;

- (void)showAdFromRootViewController:(UIViewController *)root;
@end

NS_ASSUME_NONNULL_END
