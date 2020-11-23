//
//  GetuiBXRewardVideoAd.h
//  BXSDK
//
//  Created by ak on 2020/8/17.
//  Copyright © 2020 ak. All rights reserved.
//  标准广告

#import <Foundation/Foundation.h>

@protocol GetuiBXComponentDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface GetuiBXRewardVideoAd : NSObject

@property(nonatomic, readonly, getter=isAdValid) BOOL adValid;

@property(nonatomic, weak) id <GetuiBXComponentDelegate> gtDelegate;

- (instancetype)initWithAdId:(NSString *)adId params:(GetuiBXParamObject *)params;

- (void)loadAdData;

- (void)showAdWithController:(UIViewController *)rootViewController;


@end

NS_ASSUME_NONNULL_END
