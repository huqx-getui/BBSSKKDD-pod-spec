//
//  BXMGDTDelegate.h
//  BXMSDK
//
//  Created by weicai on 2020/8/17.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXMPrecompare.h"

NS_ASSUME_NONNULL_BEGIN

/****************************************************
    MARK:---------- -----------开屏协议
 ***************************************************************************/
@protocol BXMGDTSplashManagerDelegate <NSObject>

@optional
/**
    开屏加载成功
    id:GDTSplashAd 对象
 */
-(void)gdtAdSplashAdDidLoad:(id )splashAd;
/**
    加载失败
    id:GDTSplashAd 对象
 */
-(void)gdtAdSplash:(id)splashAd  didFailWithError:(NSError *)error;

/**
     视图显示成功
     id:GDTSplashAd 对象
 */
-(void)gdtAdSplashVisible:(id)splashAd;

/**
     视图显示失敗
     id:GDTSplashAd 对象
 */
-(void)gdtAdSplashVisibleFailure:(id)splashAd error:(NSError *)error;

/**
     视图点击
     id:GDTSplashAd 对象
 */
-(void)gdtAdSplashDidClick:(id)splashAd;

/**
    视图关闭
    id:GDTSplashAd 对象
 */

-(void)gdtAdSplashClose:(id )splashAd;

@end

/**********************************************
    MARK:---------- -----------插屏协议
 *****************************************************************************************************/
@protocol BXMGDTAdInterstitialManagerDelegate <NSObject>

@optional
/**
    插屏加载成功
    id:GDTUnifiedInterstitialAd对象
 */
-(void)gdtAdInterstitialAdDidLoad:(id )interstitialAd;
/**
    插屏加载失败
    id:GDTUnifiedInterstitialAd对象
 */
-(void)gdtAdInterstitialAd:(id )interstitialAd   didFailWithError:(NSError *)error;

/**
     视图显示成功
    id:GDTUnifiedInterstitialAd对象
 */
-(void)gdtAdInterstitialAdVisible:(id )interstitialAd;
/**
     视图显示失敗
     id:GDTSplashAd 对象
 */
-(void)gdtAdInterstitialAdVisibleFailure:(id)interstitialAd error:(NSError *)error;

/**
     视图点击
    id:GDTUnifiedInterstitialAd对象
 */
-(void)gdtAdInterstitialAdDidClick:(id )interstitialAd;

/**
    视图关闭
    id:GDTUnifiedInterstitialAd对象
 */

-(void)gdtAdInterstitialAdClose:(id)interstitialAd;

@end

/**********************************************
    MARK:---------- -----------Banner协议
 *****************************************************************************************************/
@protocol BXMGDTBannerManagerDelegate <NSObject>

@optional
/**
    banner加载成功
    UIView:GDTUnifiedBannerView对象
 */
-(void)gdtAdBannerAdDidLoad:(UIView * )bannerAdView;
/**
    插屏加载失败
     UIView:GDTUnifiedBannerView对象
 */
-(void)gdtAdBannerAd:(UIView * )bannerAdView   didFailWithError:(NSError *)error;

/**
     视图显示成功
     UIView:GDTUnifiedBannerView对象
 */
-(void)gdtAdBannerAdVisible:(UIView * )bannerAdView;


/**
     视图点击
    id:GDTUnifiedBannerView对象
 */
-(void)gdtAdBannerAdDidClick:(UIView * )bannerAdView;

/**
    视图关闭
    id:GDTUnifiedBannerView对象
 */

-(void)gdtAdBannerAdClose:(UIView *)bannerAdView;

@end

/**********************************************
   MARK:---------- -----------激励视频协议
*****************************************************************************************************/
@protocol BXMGDTAdRewardVideoManagerDelegate <NSObject>

@optional
/**
    插屏加载成功
    id: GDTRewardVideoAd对象
 */
-(void)gdtRewardVideoAdDidLoad:(id )rewardedVideoAd;
/**
    插屏加载失败
    id:GDTRewardVideoAd对象
 */
-(void)gdtRewardVideoAd:(id )rewardedVideoAd   didFailWithError:(NSError *)error;

/**
     视图显示成功
    id:GDTRewardVideoAd对象
 */
-(void)gdtRewardVideoAdVisible:(id )rewardedVideoAd;


/**
     视图点击
    id:GDTRewardVideoAd对象
 */
-(void)gdtRewardVideoAdDidClick:(id )rewardedVideoAd;

/**
    视图关闭
    id:GDTRewardVideoAd对象
 */

-(void)gdtRewardVideoAdClose:(id)rewardedVideoAd;
/**
    视频播放结束
    id:GDTRewardVideoAd对象
 */

-(void)gdtRewardVideoAdPlayFinish:(id)rewardedVideoAd;
/**
    未播放结束
    id:GDTRewardVideoAd对象
 */

-(void)gdtRewardVideoAdPlayUnFinish:(id)rewardedVideoAd;

/**
     视频播放结束 是否满足激励其激励条件，可用于设置奖励
     YES 满足
     NO  不满
 */
-(void)gdtRewardVideoPlayFinishVerify:(BOOL )verify;


@end

/**********************************************
   MARK:---------- -----------信息流模板协议
*****************************************************************************************************/

@protocol BXMGDTAdNativeExpressManagerDelegate <NSObject>

@optional
/**
     信息流加载成功
    id:GDTNativeExpressAd对象
       views:信息流View
 */

-(void)gdtNativeExpressAdSuccessToLoad:(id)nativeExpressAd views:(NSArray<__kindof UIView *> *)views;

/**
     信息流加载失败
    id:GDTNativeExpressAd对象
 */

-(void)gdtNativeExpressAdFailToLoad:(id)nativeExpressAd error:(NSError *)error;

/**
     信息流渲染成功
    id:GDTNativeExpressAdView对象
 */

-(void)gdtNativeExpressAdViewRenderSuccess:(UIView *)nativeExpressAdView;

/**
     信息流视图展示成功
    id:GDTNativeExpressAdView对象
 */

-(void)gdtNativeExpressAdViewVisiable:(UIView *)nativeExpressAdView;

/**
     信息流渲染失败
    UIView:GDTNativeExpressAdView对象
 */

-(void)gdtNativeExpressAdViewRenderFail:(UIView *)nativeExpressAdView ;

/**
     信息流点击
    UIView:GDTNativeExpressAd对象
 */

-(void)gdtNativeExpressAdViewDidClick:( UIView*)nativeExpressAdView;

/**
     信息流关闭
    UIView:GDTNativeExpressAd对象
 */

-(void)gdtNativeExpressAdViewDidClose:( UIView*)nativeExpressAdView;

@end

NS_ASSUME_NONNULL_END
