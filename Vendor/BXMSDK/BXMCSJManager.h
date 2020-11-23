//
//  BXMBUDManager.h
//  BXMSDKDemo
//
//  Created by weicai on 2020/8/10.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BXMCSJDelegate.h"

#import "BXMEnumFile.h"
NS_ASSUME_NONNULL_BEGIN

@interface BXMCSJManager : NSObject

@property(nonatomic,weak)UIViewController *rootController;

#pragma mark -------开屏
@property(nonatomic,weak) id <BXMBUDSplashManagerDelegate> splashDelegate;

/**
 加载开屏广告位Id
 @param appId 应用Id
 @param adId 广告Id
 @param time 超时时间
 @param frame 开屏位置
 @param vc 当前VC
 */
-(void)loadCSJSplshWithAppId:(NSString *)appId
                         adId:(NSString *)adId
                      timeOut:(CGFloat)time
                        frame:(CGRect )frame
                      superVC:(UIViewController *)vc;
/**
    展示穿山甲
 */
-(void)showCSJSplashWithWindow:(UIWindow *)window bottomView:(UIView *)bottomView;

/**
*************************************************************************************************************************
    MARK:-------------------插屏模块
*********************************************  */
@property(nonatomic,weak)id <BXMBUAdInterstitialManagerDelegate> interstialDelegate;//c插屏代理
/**
 加载插屏
 @param appId 应用Id
 @param adId 广告位Id
 @param size 广告 size
 */
-(void)loadCSJIntertitialAppId:(NSString *)appId
                          adId:(NSString *)adId
                        adSize:(CGSize )size;
/**
    展示开屏
 */
-(void)presentInterstitialFromController:(UIViewController *)controller;


/**
*************************************************************************************************************************
    MARK:-------------------Banner模块
*********************************************  */
@property(nonatomic,weak)id <BXMBUBannerManagerDelegate> bannerDelegate;//banner
/**
 加载穿山甲
 @param appId 应用Id
 @param adId 广告Id
 @param controller 控制器
 @param frame banner位置
 */
-(void)loadCSJBannerAppId:(NSString *)appId
                     adId:(NSString *)adId
               controller:(UIViewController *)controller
              bannerFrame:(CGRect )frame;
/**
 展示banner
 @param showView 添加在显示的View上
 */
-(void)csjbannerShowView:(UIView *)showView;

/**
    移除Banner
 */
-(void)csjRemoveBanner;
/**
*************************************************************************************************************************
    MARK:-------------------全屏视频模块
*********************************************  */
@property(nonatomic,weak)id <BXMBUAdFullScreenVideoManagerDelegate> fullVideoDelegate;//全屏视频代理

/**
 加载穿山甲
 @param appId 应用Id
 @param adId 广告Id
 */
-(void)loadCSJFullVideoAppId:(NSString *)appId
                    adId:(NSString *)adId;
/**
 展示全屏视频
 @param vc 跳转控制器
 */
-(void)presentCSJFullVideoFromeController:(UIViewController *)vc;

/**
*************************************************************************************************************************
    MARK:-------------------激励视频模块
*********************************************  */
@property(nonatomic,weak)id <BXMBUAdRewardVideoManagerDelegate> rewardVideoDelegate;//激励视频代理
/**
 加载穿山甲
 @param appId 应用Id
 @param adId 广告Id
 */
-(void)loadCSJRewardVideoAppId:(NSString *)appId
                          adId:(NSString *)adId;
/**
 展示激励视频
 @param controller 控制器
 */
-(void)showCSJRewardVideoFromController:(UIViewController *)controller;

/**
*************************************************************************************************************************
    MARK:-------------------信息流模板模块
*********************************************  */
@property(nonatomic,weak)id <BXMBUAdNativeExpressManagerDelegate> nativeExpressDelegate;//激励视频代理
/**
 初始化信息流模板
 @param appId 应用Id
 @param adId 广告Id
 @param imgSize 图片大小
 @param adSize 广告大小
 */
- (void)initCSJExpressiveAppId:(NSString *)appId
                          adId:(NSString *)adId
                     imageSize:(BXMAdImageSize )imgSize
                        adSize:(CGSize )adSize
                    controller:(UIViewController *)controller;

/**
 加载信息流广告
 @param count 所需加载的条数
*/
- (void)loadNativeExpressAdCount:(NSInteger)count;


@end

NS_ASSUME_NONNULL_END
