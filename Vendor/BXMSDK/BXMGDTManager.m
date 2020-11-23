//
//  BXMGDTManager.m
//  BXMSDK
//
//  Created by weicai on 2020/8/17.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "BXMGDTManager.h"



@interface BXMGDTManager ()
#if BXM_GDTCLASS_EXIST
<
GDTSplashAdDelegate,
GDTUnifiedInterstitialAdDelegate,
GDTUnifiedBannerViewDelegate,
GDTRewardedVideoAdDelegate,
GDTNativeExpressAdDelegete,
GDTUnifiedNativeAdDelegate
>

/*
   开屏
*/
@property(nonatomic,strong)GDTSplashAd *gdtSplsh;
/**
      插屏
 */
@property (nonatomic, strong) GDTUnifiedInterstitialAd *gdtInterstitial;
/**
    Banner
*/
@property (nonatomic, strong) GDTUnifiedBannerView *gdtBanner;
/**
    激励视频
 */
@property(nonatomic,strong)GDTRewardVideoAd *gdtRewardVideo;
/**
    信息流模板
 */
@property (nonatomic, strong) GDTNativeExpressAd *gdtNativeExpressAd;
/**
    信息流自渲染
 */
@property (nonatomic, strong) GDTUnifiedNativeAd *gdtNativeAd;

#endif
@end

@implementation BXMGDTManager

/**
      MARK:-------  注册广点通
 */
-(void)gdtRegistWithAppId:(NSString *)appId
{
#if BXM_GDTCLASS_EXIST
      [GDTSDKConfig registerAppId:appId];
#endif
}

-(NSError *)getNoGDTLibSDKError
{
    NSError *error =  [NSError errorWithDomain:NSCocoaErrorDomain code:11109 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"该项目未导入广点通SDK，如需使用，请导入广点通包"], NSLocalizedDescriptionKey,nil]];
    return error;
}
/**************************************************************************************************************************
        MARK:------------开屏模块
****************************************************************************************************************************** */
/**
     加载开屏
 /// @param appId 应用Id
 /// @param adId 广告位Id
 /// @param time 请求超时c时间
 */
-(void)loadGDTSplshWithAppId:(NSString *)appId
                        adId:(NSString *)adId
                     timeOut:(CGFloat )time
{
#if BXM_GDTCLASS_EXIST
    [self gdtRegistWithAppId:appId];
    
    self.gdtSplsh = [[GDTSplashAd alloc]initWithPlacementId:adId];
    self.gdtSplsh.delegate = self;
    self.gdtSplsh.fetchDelay = time;
    [self.gdtSplsh loadAd];
#else
    if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplash:didFailWithError:)]) {
        [self.splashDelegate gdtAdSplash:nil didFailWithError:[self getNoGDTLibSDKError]];
    }
    
#endif
}
/**
 开屏展示
 @param window 当前Window
 @param bottomView 底部View
 @param skipView 
 */
-(void)showGDTSplshWindow:(UIWindow *)window
               bottomView:(UIView *)bottomView
                 skipView:(UIView *)skipView
{
#if BXM_GDTCLASS_EXIST
    [self.gdtSplsh showAdInWindow:window withBottomView:bottomView skipView:skipView];
    
#endif
}

#pragma mark -----------GDTSplashAdDelegate

#if BXM_GDTCLASS_EXIST
-(void)splashAdDidLoad:(GDTSplashAd *)splashAd
{
    if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplashAdDidLoad:)]) {
        [self.splashDelegate gdtAdSplashAdDidLoad:splashAd];
    }
}


- (void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd
{
    if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplashVisible:)]) {
           [self.splashDelegate gdtAdSplashVisible:splashAd];
       }
}


-(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error
{
    if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplash:didFailWithError:)]) {
               [self.splashDelegate gdtAdSplash:splashAd didFailWithError:error];
    }
}

-(void)splashAdClicked:(GDTSplashAd *)splashAd
{
    if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplashDidClick:)]) {
       [self.splashDelegate gdtAdSplashDidClick:splashAd];
    }
    
}

-(void)splashAdClosed:(GDTSplashAd *)splashAd
{
   if ([self.splashDelegate respondsToSelector:@selector(gdtAdSplashClose:)]) {
       [self.splashDelegate gdtAdSplashClose:splashAd];
        }
    
}

/**
 * 开屏广告剩余时间回调
 */
- (void)splashAdLifeTime:(NSUInteger)time
{}
#endif

/**************************************************************************************************************************
        MARK:------------插屏模块
****************************************************************************************************************************** */
/**
     加载插屏
 /// @param appId 应用Id
 /// @param adId 广告Id
 */
-(void)loadGDTIntertitialAppId:(NSString *)appId
                          adId:(NSString *)adId
{
#if BXM_GDTCLASS_EXIST
    [self gdtRegistWithAppId:appId];
    self.gdtInterstitial = [[GDTUnifiedInterstitialAd alloc] initWithPlacementId:adId];
    self.gdtInterstitial.delegate = self;
    [self.gdtInterstitial loadAd];
#else
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAd:didFailWithError:)]) {
        [self.insterstialDelegate gdtAdInterstitialAd:nil didFailWithError:[self getNoGDTLibSDKError]];
    }
    
#endif
       
}

/**
 插屏显示
 @param controller 控制器
 */
-(void)presentGDTFromController:(UIViewController *)controller
{
#if BXM_GDTCLASS_EXIST
    [self.gdtInterstitial presentAdFromRootViewController:controller];
#else
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAd:didFailWithError:)]) {
        [self.insterstialDelegate gdtAdInterstitialAd:nil didFailWithError:[self getNoGDTLibSDKError]];
    }
    
#endif
}

#pragma mark _________GDTUnifiedInterstitialAdDelegate

#if BXM_GDTCLASS_EXIST
/**
 *  插屏2.0广告预加载成功回调
 *  当接收服务器返回的广告数据成功且预加载后调用该函数
 */
- (void)unifiedInterstitialSuccessToLoadAd:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAdDidLoad:)]) {
        [self.insterstialDelegate gdtAdInterstitialAdDidLoad:unifiedInterstitial];
    }
}

/**
 *  插屏2.0广告预加载失败回调
 *  当接收服务器返回的广告数据失败后调用该函数
 */
- (void)unifiedInterstitialFailToLoadAd:(GDTUnifiedInterstitialAd *)unifiedInterstitial error:(NSError *)error
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAd:didFailWithError:)]) {
        [self.insterstialDelegate gdtAdInterstitialAd:unifiedInterstitial didFailWithError:error];
    }
}
/**
 *  插屏2.0广告视图展示成功回调
 *  插屏2.0广告展示成功回调该函数
 */
- (void)unifiedInterstitialDidPresentScreen:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAdVisible:)]) {
        [self.insterstialDelegate gdtAdInterstitialAdVisible:unifiedInterstitial];
    }
}
/**
 *  插屏2.0广告视图展示失败回调
 *  插屏2.0广告展示失败回调该函数
 */
- (void)unifiedInterstitialFailToPresent:(GDTUnifiedInterstitialAd *)unifiedInterstitial error:(NSError *)error
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAdVisibleFailure:error:)]) {
        [self.insterstialDelegate gdtAdInterstitialAdVisibleFailure:unifiedInterstitial error:error];
    }
}
/**
 *  插屏2.0广告点击回调
 */
- (void)unifiedInterstitialClicked:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAdDidClick:)]) {
        [self.insterstialDelegate gdtAdInterstitialAdDidClick:unifiedInterstitial];
    }
}

/**
 *  插屏2.0广告展示结束回调
 *  插屏2.0广告展示结束回调该函数
 */
- (void)unifiedInterstitialDidDismissScreen:(GDTUnifiedInterstitialAd *)unifiedInterstitial
{
    if ([self.insterstialDelegate respondsToSelector:@selector(gdtAdInterstitialAdClose:)]) {
        [self.insterstialDelegate gdtAdInterstitialAdClose:unifiedInterstitial];
    }
}
#endif

/**************************************************************************************************************************
        MARK:------------Banner模块
****************************************************************************************************************************** */
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
       autoFreshInterval :(CGFloat)interval
{
#if BXM_GDTCLASS_EXIST
        [self gdtRegistWithAppId:appId];
        if (self.gdtBanner.superview) {
            [self.gdtBanner removeFromSuperview];
            self.gdtBanner = nil;
        }

        self.gdtBanner = [[GDTUnifiedBannerView alloc]
        initWithFrame:frame
        placementId:adId
        viewController:controller];
        self.gdtBanner.animated = YES;
        self.gdtBanner.autoSwitchInterval = interval;
        self.gdtBanner.delegate = self;
        [ self.gdtBanner loadAdAndShow];
   
#else
    if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAd:didFailWithError:)]) {
           [self.bannerDelegate gdtAdBannerAd:nil didFailWithError:[self getNoGDTLibSDKError]];
       }
#endif
}
/**
 显示Banner
 @param showView 需要banner展示在上面的View
 */
-(void)showGDTbannerView:(UIView *)showView
{
#if BXM_GDTCLASS_EXIST
    if (self.gdtBanner.superview) {
        [self.gdtBanner removeFromSuperview];
    }
    [showView addSubview:self.gdtBanner];
#endif
}
/**
    移除Banner
 */
-(void)removeGDTBannerView
{
#if BXM_GDTCLASS_EXIST
    if (self.gdtBanner.superview) {
        [self.gdtBanner removeFromSuperview];
    }
#endif
}

#pragma mark ---------GDTUnifiedBannerViewDelegate

#if BXM_GDTCLASS_EXIST
/**
 *  请求广告条数据成功后调用
 *  当接收服务器返回的广告数据成功后调用该函数
 */
- (void)unifiedBannerViewDidLoad:(GDTUnifiedBannerView *)unifiedBannerView
{
    if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAdDidLoad:)]) {
        [self.bannerDelegate gdtAdBannerAdDidLoad:unifiedBannerView];
    }
}
/**
 *  请求广告条数据失败后调用
 *  当接收服务器返回的广告数据失败后调用该函数
 */
- (void)unifiedBannerViewFailedToLoad:(GDTUnifiedBannerView *)unifiedBannerView error:(NSError *)error
{
   if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAd:didFailWithError:)]) {
       [self.bannerDelegate gdtAdBannerAd:unifiedBannerView didFailWithError:error];
   }
}
/**
 *  banner2.0曝光回调
 */
- (void)unifiedBannerViewWillExpose:(GDTUnifiedBannerView *)unifiedBannerView
{
     if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAdVisible:)]) {
          [self.bannerDelegate gdtAdBannerAdVisible:unifiedBannerView];
      }
}


/**
 *  banner2.0点击回调
 */
- (void)unifiedBannerViewClicked:(GDTUnifiedBannerView *)unifiedBannerView
{
   if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAdDidClick:)]) {
         [self.bannerDelegate gdtAdBannerAdDidClick:unifiedBannerView];
     }
}

/**
 *  banner2.0被用户关闭时调用
 */
- (void)unifiedBannerViewWillClose:(GDTUnifiedBannerView *)unifiedBannerView
{
   if ([self.bannerDelegate respondsToSelector:@selector(gdtAdBannerAdClose:)]) {
       [self.bannerDelegate gdtAdBannerAdClose:unifiedBannerView];
     }
}
#endif

/**************************************************************************************************************************
        MARK:------------激励视频模块
****************************************************************************************************************************** */
/**
 加载激励视频
 @param appId 应用Id
 @param adId 广告Id
 @param muted 是否静音 YES:是   NO:否
 */
-(void)loadGDTRewardVideoAppId:(NSString *)appId
                          adId:(NSString *)adId
                    videoMuted:(BOOL)muted
{
#if BXM_GDTCLASS_EXIST
    [self gdtRegistWithAppId:appId];
    self.gdtRewardVideo = [[GDTRewardVideoAd alloc] initWithPlacementId:adId];
    self.gdtRewardVideo.delegate = self;
    self.gdtRewardVideo.videoMuted = muted; // 设置激励视频是否静音
    [self.gdtRewardVideo loadAd];
#else
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAd:didFailWithError:)]) {
        [self.rewardDelegate gdtRewardVideoAd:nil didFailWithError:[self getNoGDTLibSDKError]];
    }
    
#endif
}
/**
     展示视屏
 */
-(void)showGDTVideoFromRootController:(UIViewController *)controller
{
#if BXM_GDTCLASS_EXIST
    [self.gdtRewardVideo showAdFromRootViewController:controller];
#endif
}

#pragma mark ------GDTRewardedVideoAdDelegate

#if BXM_GDTCLASS_EXIST
/**
 广告数据加载成功回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidLoad:(GDTRewardVideoAd *)rewardedVideoAd
{
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdDidLoad:)]) {
        [self.rewardDelegate gdtRewardVideoAdDidLoad:rewardedVideoAd];
    }
    
}

/**
 视频广告曝光回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidExposed:(GDTRewardVideoAd *)rewardedVideoAd
{
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdVisible:)]) {
           [self.rewardDelegate gdtRewardVideoAdVisible:rewardedVideoAd];
       }
}

/**
 视频播放页关闭回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClose:(GDTRewardVideoAd *)rewardedVideoAd
{
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdClose:)]) {
              [self.rewardDelegate gdtRewardVideoAdClose:rewardedVideoAd];
      }
    
    if (!self.isPlayFinished) {
        if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdPlayUnFinish:)]) {
            [self.rewardDelegate gdtRewardVideoAdPlayUnFinish:rewardedVideoAd];
        }
    }
    if (!self.isEffective) {
        if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoPlayFinishVerify:)]) {
               [self.rewardDelegate gdtRewardVideoPlayFinishVerify:NO];
           }
               
    }
    
    self.isEffective = NO;
    self.isPlayFinished = NO;
}

/**
 视频广告信息点击回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidClicked:(GDTRewardVideoAd *)rewardedVideoAd
{
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdDidClick:)]) {
        [self.rewardDelegate gdtRewardVideoAdDidClick:rewardedVideoAd];
    }
     
}

/**
 视频广告各种错误信息回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 @param error 具体错误信息
 */
- (void)gdt_rewardVideoAd:(GDTRewardVideoAd *)rewardedVideoAd didFailWithError:(NSError *)error
{
  if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAd:didFailWithError:)]) {
         [self.rewardDelegate gdtRewardVideoAd:rewardedVideoAd didFailWithError:error];
     }
}

/**
 视频广告播放达到激励条件回调

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidRewardEffective:(GDTRewardVideoAd *)rewardedVideoAd
{
    self.isEffective = YES;
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoPlayFinishVerify:)]) {
        [self.rewardDelegate gdtRewardVideoPlayFinishVerify:YES];
    }
}

/**
 视频广告视频播放完成

 @param rewardedVideoAd GDTRewardVideoAd 实例
 */
- (void)gdt_rewardVideoAdDidPlayFinish:(GDTRewardVideoAd *)rewardedVideoAd
{
    self.isPlayFinished = YES;
    if ([self.rewardDelegate respondsToSelector:@selector(gdtRewardVideoAdPlayFinish:)]) {
       [self.rewardDelegate gdtRewardVideoAdPlayFinish:rewardedVideoAd];
   }
}

#endif

/**************************************************************************************************************************
        MARK:------------信息流模板模块
****************************************************************************************************************************** */

/**
 初始化广点通广告
 @param appId 应用Id
 @param adId  广告ID
 @param adSize 广告size
 */
- (void)initGDTNativeExpressAppId:(NSString *)appId
                             adId:(NSString *)adId
                           adSize:(CGSize)adSize
                   rootController:(UIViewController *)controller
{
#if BXM_GDTCLASS_EXIST
    self.rootController = controller;
    [self gdtRegistWithAppId:appId];
    
    self.gdtNativeExpressAd = [[GDTNativeExpressAd alloc] initWithPlacementId:adId adSize:adSize];
    self.gdtNativeExpressAd.delegate = self;
#endif
}
/**
 /// 加载广告
 @param count 加载条数
 */
- (void)loadGDTnativeExpressWithCount:(NSInteger)count
{
#if BXM_GDTCLASS_EXIST
    [self.gdtNativeExpressAd loadAd:count];
#else
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdFailToLoad:error:)]) {
        [self.nativeExpressDelegate gdtNativeExpressAdFailToLoad:nil error:[self getNoGDTLibSDKError]];
    }
    
#endif
}

#pragma mark ----GDTNativeExpressAdDelegete
#if BXM_GDTCLASS_EXIST
-(void)nativeExpressAdSuccessToLoad:(GDTNativeExpressAd *)nativeExpressAd views:(NSArray<__kindof GDTNativeExpressAdView *> *)views
{
    [views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
            GDTNativeExpressAdView *expressView = (GDTNativeExpressAdView *)obj;
            expressView.controller = self.rootController;
            [expressView render];
    }];
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdSuccessToLoad:views:)]) {
        [self.nativeExpressDelegate gdtNativeExpressAdSuccessToLoad:nativeExpressAd views:views];
    }
    
}

-(void)nativeExpressAdFailToLoad:(GDTNativeExpressAd *)nativeExpressAd error:(NSError *)error
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdFailToLoad:error:)]) {
        [self.nativeExpressDelegate gdtNativeExpressAdFailToLoad:nativeExpressAd error:error];
    }
}

/**
 * 原生模板广告渲染成功, 此时的 nativeExpressAdView.size.height 根据 size.width 完成了动态更新。
 */
- (void)nativeExpressAdViewRenderSuccess:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdViewRenderSuccess:)]) {
           [self.nativeExpressDelegate gdtNativeExpressAdViewRenderSuccess:nativeExpressAdView ];
       }
}

/**
 * 原生模板广告渲染失败
 */
-(void)nativeExpressAdViewRenderFail:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdViewRenderFail:)]) {
        [self.nativeExpressDelegate gdtNativeExpressAdViewRenderFail:nativeExpressAdView];
    }
}

-(void)nativeExpressAdViewExposure:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdViewVisiable:)]) {
        [self.nativeExpressDelegate gdtNativeExpressAdViewVisiable:nativeExpressAdView];
    }
}
-(void)nativeExpressAdViewClicked:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdViewDidClick:)]) {
           [self.nativeExpressDelegate gdtNativeExpressAdViewDidClick:nativeExpressAdView];
       }
}

-(void)nativeExpressAdViewClosed:(GDTNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(gdtNativeExpressAdViewDidClose:)]) {
              [self.nativeExpressDelegate gdtNativeExpressAdViewDidClose:nativeExpressAdView];
        }
}

#endif

@end
