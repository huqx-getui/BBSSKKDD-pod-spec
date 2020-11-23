//
//  BXMFullScreenAd.h
//  BXMSDKDemo
//
//  Created by Mac on 2020/1/7.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol BXMFullScreenAdDelegate <NSObject>

@optional

/**
    视频加载成功  请保证视频加载成功在显示视频
 */
-(void)bxmFullScreenVideoAdLaodSuccess;
/**
    视频加载失败
 */
-(void)bxmFullScreenVideoAdLaodFailure:(NSError *_Nullable)error;
/**
    视频显示成功
 */
-(void)bxmFullScreenVideoShowSuccess;

/**
    视频播放结束
 */
-(void)bxmFullScreenVideoPlayFinish;
/**
    视频播放未结束
 */
-(void)bxmFullScreenVideoPlayUnFinish;
/**
    视频点击
 */
-(void)bxmFullScreenVideoClick;

/**
    视频关闭
 */
-(void)bxmFullScreenVideoClose;


@end

NS_ASSUME_NONNULL_BEGIN

@interface BXMFullScreenAd : NSObject

@property(nonatomic,weak)id <BXMFullScreenAdDelegate> delegate;

//-(void)splshAdJumpOver
/// 初始化

/// @param adId  // 广告位Id
- (instancetype)initFullScreeWithAdId:(NSString *)adId;

//展示视屏
-(void)showAdFromViewController:(UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
