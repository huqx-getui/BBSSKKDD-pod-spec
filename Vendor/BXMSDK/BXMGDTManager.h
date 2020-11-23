//
//  BXMGDTManager.h
//  BXMSDK
//
//  Created by weicai on 2020/8/17.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BXMEnumFile.h"
#import "BXMGDTDelegate.h"




@interface BXMGDTManager : NSObject
/**
    根控制器
 */
@property(nonatomic,weak)UIViewController *rootController;
/******************************************
    MARK:------------开屏模块
********************************************** */
@property(nonatomic,weak)id <BXMGDTSplashManagerDelegate> splashDelegate;
/**
     加载开屏
 /// @param appId 应用Id
 /// @param adId 广告位Id
 /// @param time 请求超时c时间
 */


-(void)loadGDTSplshWithAppId:(NSString *)appId
                        adId:(NSString *)adId
                     timeOut:(CGFloat )time;
/*
 开屏展示
 @param window 当前Window
 @param bottomView 底部View
 @param skipView
 */
-(void)showGDTSplshWindow:(UIWindow *)window
               bottomView:(UIView *)bottomView
                 skipView:(UIView *)skipView;
/**************************************************************************************************************************
        MARK:------------插屏模块
****************************************************************************************************************************** */
@property(nonatomic,weak)id <BXMGDTAdInterstitialManagerDelegate> insterstialDelegate;
/**
     加载插屏
 /// @param appId 应用Id
 /// @param adId 广告Id
 */
-(void)loadGDTIntertitialAppId:(NSString *)appId
                          adId:(NSString *)adId;
/**
 插屏显示
 @param controller 控制器
 */
-(void)presentGDTFromController:(UIViewController *)controller;



/**************************************************************************************************************************
        MARK:------------Banner模块
****************************************************************************************************************************** */
@property(nonatomic,weak)id<BXMGDTBannerManagerDelegate> bannerDelegate;
/**
 加载Banner
 @param appId 应用Id
 @param adId h广告Id
 @param frame banner位置
 @param controller 控制器
 @param interval 自动刷新时间
 */
-(void)loadGDTBannerAppId:(NSString *)appId
                     adId:(NSString *)adId
              bannerFrame:(CGRect )frame
           rootController:(UIViewController *)controller
       autoFreshInterval :(CGFloat)interval;
/*
 显示Banner
 @param showView 需要banner展示在上面的View
 */
-(void)showGDTbannerView:(UIView *)showView;
/**
    移除Banner
 */
-(void)removeGDTBannerView;

/**************************************************************************************************************************
        MARK:------------激励视频模块
****************************************************************************************************************************** */
@property(nonatomic,weak)id <BXMGDTAdRewardVideoManagerDelegate> rewardDelegate;
@property(nonatomic,assign)BOOL isPlayFinished;//視頻是否播播放完
@property(nonatomic,assign)BOOL isEffective;//視頻是否到达激励条件
/**
 加载激励视频
 @param appId 应用Id
 @param adId 广告Id
 @param muted 是否静音 YES:是   NO:否
 */
-(void)loadGDTRewardVideoAppId:(NSString *)appId
                          adId:(NSString *)adId
                    videoMuted:(BOOL)muted;
/**
     展示视屏
 */
-(void)showGDTVideoFromRootController:(UIViewController *)controller;

/**************************************************************************************************************************
        MARK:------------信息流模板模块
****************************************************************************************************************************** */
@property(nonatomic,weak)id <BXMGDTAdNativeExpressManagerDelegate> nativeExpressDelegate;
/**
 初始化广点通广告
 @param appId 应用Id
 @param adId  广告ID
 @param adSize 广告size
 */
- (void)initGDTNativeExpressAppId:(NSString *)appId
                             adId:(NSString *)adId
                           adSize:(CGSize)adSize
                   rootController:(UIViewController *)controller;
/**
 /// 加载广告
 @param count 加载条数
 */
- (void)loadGDTnativeExpressWithCount:(NSInteger)count;

@end


