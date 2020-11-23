//
//  GetuiBXSdK.h
//  GetuiBXSdK
//
//  Created by ak on 2020/08/05.
//  Copyright © 2020 ak. All rights reserved.
//  非标广告

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GetuiBXComponentDelegate;

@class GetuiBXParamObject;

@interface GetuiBXFloat : NSObject

@property(nonatomic, weak) id <GetuiBXComponentDelegate> gtDelegate;

 
- (instancetype)initWithAdId:(NSString *)adId
                       frame:(CGRect)frame
                  controller:(UIViewController*)controller
                       param:(GetuiBXParamObject *)param;

- (void)loadAdData;

- (void)showToView:(UIView *)view;

@end


NS_ASSUME_NONNULL_END
