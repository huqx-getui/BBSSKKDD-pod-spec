//
//  GetuiBXBanner.h
//  BXSDK
//
//  Created by ak on 2020/8/14.
//  Copyright © 2020 ak. All rights reserved.
//  标准广告

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@protocol GetuiBXComponentDelegate;

@class GetuiBXParamObject;

@interface GetuiBXBanner : NSObject

@property(nonatomic, weak) id <GetuiBXComponentDelegate> gtDelegate;

- (instancetype)initWithAdId:(NSString *)adId
                       frame:(CGRect)frame
                  controller:(UIViewController *)controller
                       param:(GetuiBXParamObject *)param;

- (void)loadAndShow:(UIView *)view;

- (void)remove;

@end

NS_ASSUME_NONNULL_END
