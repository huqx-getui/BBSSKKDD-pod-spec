//
//  GetuiBXAd.h
//  GetuiBXAd
//
//  Created by ak on 2020/8/5.
//  Copyright © 2020 Mac. All rights reserved.
//  非标广告

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __has_include(<GetuiBXSdk/GetuiBXSdk.h>)
#import <GetuiBXSdk/GetuiBXCons.h>
#else

#endif

NS_ASSUME_NONNULL_BEGIN

@class GetuiBXAdObject, GetuiBXParamObject;

@protocol GetuiBXComponentDelegate;

@interface GetuiBXAd : NSObject

@property (nonatomic, weak) id<GetuiBXComponentDelegate> gtDelegate;

@property (nonatomic, strong) NSArray *list;

- (instancetype)initWithAdId:(NSString *)adId
                   imageSize:(GetuiAdSize)imageSize
                   param:(GetuiBXParamObject *)param;

/// 加载广告
/// @param count  max to 3
- (void)loadAdWithCount:(NSInteger)count;

@end

NS_ASSUME_NONNULL_END

