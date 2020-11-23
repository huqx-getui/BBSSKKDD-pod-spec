//
//  BXMEnumFile.h
//  BXMSDKDemo
//
//  Created by Mac on 2019/12/31.
//  Copyright © 2019 Mac. All rights reserved.
//

#ifndef BXMEnumFile_h
#define BXMEnumFile_h


#define BXM_DEPRECATED_MSG(s) __attribute__((deprecated(s)))

// 自渲染广告类型
typedef NS_ENUM(NSInteger, BXMNativeAdMode) {
    BXMNativeAdModeSmallImage = 2, // 小图
    BXMNativeAdModeLargeImage = 3, // 大图
    BXMNativeAdModeGroupImage = 4, // 组图
    BXMNativeAdModeVideo = 5       // 视频
};

// 广告图片尺寸
typedef NS_ENUM(NSInteger, BXMAdImageSize) {
    BXMAdImageSize_Banner600_90,
    BXMAdImageSize_Banner600_100,
    BXMAdImageSize_Banner600_150,
    BXMAdImageSize_Banner600_260,
    BXMAdImageSize_Banner600_286,
    BXMAdImageSize_Banner600_300,
    BXMAdImageSize_Banner600_388,
    BXMAdImageSize_Banner600_400,
    BXMAdImageSize_Banner600_500,
    BXMAdImageSize_Feed228_150,
    BXMAdImageSize_Feed690_388,
    BXMAdImageSize_Interstitial600_400,
    BXMAdImageSize_Interstitial600_600,
    BXMAdImageSize_Interstitial600_900,
    BXMAdImageSize_DrawFullScreen
};

#endif /* BXMEnumFile_h */
