//
//  GetuiBXCons.h
//  BXSDK
//
//  Created by ak on 2020/8/5.
//  Copyright © 2020 ak. All rights reserved.
//

#import <Foundation/Foundation.h>


// 自渲染广告类型
typedef NS_ENUM(NSInteger, GetuiAdMode) {
    GetuiAdModeSmallImage = 2, // 小图
    GetuiAdModeLargeImage = 3, // 大图
    GetuiAdModeGroupImage = 4, // 组图
    GetuiAdModeVideo = 5       // 视频
};

//广告图片尺寸
typedef NS_ENUM(NSInteger, GetuiAdSize) {
    GetuiAdSize_Banner600_90,
    GetuiAdSize_Banner600_100,
    GetuiAdSize_Banner600_150,
    GetuiAdSize_Banner600_260,
    GetuiAdSize_Banner600_286,
    GetuiAdSize_Banner600_300,
    GetuiAdSize_Banner600_388,
    GetuiAdSize_Banner600_400,
    GetuiAdSize_Banner600_500,
    GetuiAdSize_Feed228_150,
    GetuiAdSize_Feed690_388,
    GetuiAdSize_Interstitial600_400,
    GetuiAdSize_Interstitial600_600,
    GetuiAdSize_Interstitial600_900,
    GetuiAdSize_DrawFullScreen
};

