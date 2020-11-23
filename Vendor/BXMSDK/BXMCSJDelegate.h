//
//  BXMBUADDelegate.h
//  BXMSDKDemo
//
//  Created by weicai on 2020/8/10.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXMPrecompare.h"

NS_ASSUME_NONNULL_BEGIN

/****************************************************
    MARK:---------- -----------开屏协议
 ***************************************************************************/
@protocol BXMBUDSplashManagerDelegate <NSObject>

@optional

/**
    开屏加载成功
 */
-(void)csjAdSplashAdDidLoad:(UIView *)splashAd;
/**
    加载失败
 */
-(void)csjAdSplash:(UIView * )splashAd   didFailWithError:(NSError *)error;

/**
     视图显示成功
 */
-(void)csjAdSplashVisible:(UIView *)splashAd;


/**
     视图点击
 */
-(void)csjAdSplashDidClick:(UIView *)splashAd;

/**
    视图关闭
 */

-(void)csjAdSplashClose:(UIView *)splashAd;



@end

/**********************************************
    MARK:---------- -----------插屏协议
 *****************************************************************************************************/
@protocol BXMBUAdInterstitialManagerDelegate <NSObject>

@optional
/**
    插屏加载成功
    id:BUNativeExpressInterstitialAd对象
 */
-(void)csjInterstitialAdDidLoad:(id )interstitialAd;
/**
    插屏加载失败
    id:BUNativeExpressInterstitialAd对象
 */
-(void)csjInterstitialAd:(id )interstitialAd   didFailWithError:(NSError *)error;

/**
     视图显示成功
    id:BUNativeExpressInterstitialAd对象
 */
-(void)csjInterstitialAdVisible:(id )interstitialAd;


/**
     视图点击
    id:BUNativeExpressInterstitialAd对象
 */
-(void)csjInterstitialAdDidClick:(id )interstitialAd;

/**
    视图关闭
    id:BUNativeExpressInterstitialAd对象
 */

-(void)csjInterstitialAdClose:(id)interstitialAd;


@end
/**********************************************
    MARK:---------- -----------Banner协议
 *****************************************************************************************************/
@protocol BXMBUBannerManagerDelegate <NSObject>

@optional
/**
    banner加载成功
    UIView:BUNativeExpressBannerView对象
 */
-(void)csjBannerAdDidLoad:(UIView * )bannerAdView;
/**
    插屏加载失败
     UIView:BUNativeExpressBannerView对象
 */
-(void)csjBannerAd:(UIView * )bannerAdView   didFailWithError:(NSError *)error;

/**
     视图显示成功
     UIView:BUNativeExpressBannerView对象
 */
-(void)csjBannerAdVisible:(UIView * )bannerAdView;


/**
     视图点击
    id:BUNativeExpressInterstitialAd对象
 */
-(void)csjBannerAdDidClick:(UIView * )bannerAdView;

/**
    视图关闭
    id:BUNativeExpressInterstitialAd对象
 */

-(void)csjBannerAdClose:(UIView *)bannerAdView;

@end

/**********************************************
   MARK:---------- -----------全屏视频协议
*****************************************************************************************************/
@protocol BXMBUAdFullScreenVideoManagerDelegate <NSObject>

@optional
/**
    全屏加载成功
    id: BUNativeExpressFullscreenVideoAd对象
 */
-(void)csjFullScreenVideoAdDidLoad:(id )fullscreenVideoAd;

/**
    全屏加载失败
    id:BUNativeExpressFullscreenVideoAd对象
 */
-(void)csjFullScreenVideoAd:(id )fullscreenVideoAd   didFailWithError:(NSError *)error;

/**
   全屏渲染失败
   id:BUNativeExpressFullscreenVideoAd对象
*/
-(void)csjFullScreenVideoAdRenderFail:(id )fullscreenVideoAd   didFailWithError:(NSError *)error;

/**
     视图显示成功
    id:BUNativeExpressFullscreenVideoAd对象
 */
-(void)csjFullScreenVideoAdVisible:(id )fullscreenVideoAd;


/**
     视图点击
    id:BUNativeExpressFullscreenVideoAd对象
 */
-(void)csjFullScreenVideoAdDidClick:(id )fullscreenVideoAd;

/**
    视图关闭
    id:BUNativeExpressFullscreenVideoAdAd对象
 */

-(void)csjFullScreenVideoAdClose:(id)fullscreenVideoAd;
/**
    视频播放结束
    id:BUNativeExpressFullscreenVideoAdAd对象
 */

-(void)csjFullScreenVideoAdPlayFinish:(id)fullscreenVideoAd;
/**
    未播放结束
    id:BUNativeExpressFullscreenVideoAdAd对象
 */

-(void)csjFullScreenVideoAdPlayUnFinish:(id)fullscreenVideoAd;


@end

/**********************************************
   MARK:---------- -----------激励视频协议
*****************************************************************************************************/
@protocol BXMBUAdRewardVideoManagerDelegate <NSObject>

@optional
/**
    插屏加载成功
    id: BUNativeExpressRewardedVideoAd对象
 */
-(void)csjRewardVideoAdDidLoad:(id )rewardedVideoAd;
/**
    插屏加载失败
    id:BUNativeExpressRewardedVideoAd对象
 */
-(void)csjRewardVideoAd:(id )rewardedVideoAd   didFailWithError:(NSError *)error;

/**
    激励视频渲染失败
    id:BUNativeExpressRewardedVideoAd对象
 */
-(void)csjRewardVideoAdRenderFail:(id )rewardedVideoAd   didFailWithError:(NSError *)error;


/**
     视图显示成功
    id:BUNativeExpressRewardedVideoAd对象
 */
-(void)csjRewardVideoAdVisible:(id )rewardedVideoAd;


/**
     视图点击
    id:BUNativeExpressRewardedVideoAd对象
 */
-(void)csjRewardVideoAdDidClick:(id )rewardedVideoAd;

/**
    视图关闭
    id:BUNativeExpressRewardedVideoAd对象
 */

-(void)csjRewardVideoAdClose:(id)rewardedVideoAd;
/**
    视频播放结束
    id:BUNativeExpressRewardedVideoAd对象
 */

-(void)csjRewardVideoAdPlayFinish:(id)rewardedVideoAd;
/**
    未播放结束
    id:BUNativeExpressRewardedVideoAd对象
 */

-(void)csjRewardVideoAdPlayUnFinish:(id)rewardedVideoAd;

/**
     视频播放结束 是否满足激励其激励条件，可用于设置奖励
     YES 满足
     NO  不满
 */
-(void)csjRewardVideoPlayFinishVerify:(BOOL )verify;


@end

/**********************************************
   MARK:---------- -----------信息流模板协议
*****************************************************************************************************/

@protocol BXMBUAdNativeExpressManagerDelegate <NSObject>

@optional
/**
     信息流加载成功
    id:BUNativeExpressAdManager对象
       views:信息流View
 */

-(void)csjNativeExpressAdSuccessToLoad:(id)nativeExpressAd views:(NSArray<__kindof UIView *> *)views;

/**
     信息流加载失败
    id:BUNativeExpressAdManager对象
 */

-(void)csjNativeExpressAdFailToLoad:(id)nativeExpressAd error:(NSError *)error;

/**
     信息流渲染成功
    id:BUNativeExpressAdView对象
 */

-(void)csjNativeExpressAdViewRenderSuccess:(UIView *)nativeExpressAdView;

/**
     信息流视图将要展示
    id:BUNativeExpressAdView对象
 */

-(void)csjNativeExpressAdViewWillShow:(UIView *)nativeExpressAdView;

/**
     信息流渲染失败
    UIView:BUNativeExpressAdView对象
 */

-(void)csjNativeExpressAdViewRenderFail:(UIView *)nativeExpressAdView error:(NSError *)error;

/**
     信息流点击
    UIView:BUNativeExpressAdView对象
 */

-(void)csjNativeExpressAdViewDidClick:( UIView*)nativeExpressAdView;

/**
     信息流关闭
    UIView:BUNativeExpressAdView对象
 */

-(void)csjNativeExpressAdViewDidClose:( UIView*)nativeExpressAdView;


@end



NS_ASSUME_NONNULL_END
