//
//  BXMBUDManager.m
//  BXMSDKDemo
//
//  Created by weicai on 2020/8/10.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "BXMCSJManager.h"
#import "BXMPrecompare.h"

/**
    暂无穿山甲包
 */
static const NSInteger KBXM_NOCSjLIB = 11108;


@interface BXMCSJManager ()
#if BXM_CSJCLASS_EXIST
<
BUSplashAdDelegate,
BUNativeExpresInterstitialAdDelegate,
BUNativeExpressBannerViewDelegate,
BUNativeExpressFullscreenVideoAdDelegate,
BUNativeExpressRewardedVideoAdDelegate,
BUNativeExpressAdViewDelegate,
BUNativeAdsManagerDelegate
>

/**
     开屏
 */
@property(nonatomic,strong) BUSplashAdView  * csjSplsh;
/***
      插屏
 */
@property (nonatomic, strong) BUNativeExpressInterstitialAd *csjInterstitialAd;

/**
      全屏视频
 */
@property(nonatomic,strong)BUNativeExpressFullscreenVideoAd *csjFullScreen;
/**
 激励视频
 */
@property(nonatomic,strong)BUNativeExpressRewardedVideoAd *csjRewardVideo;
/**
     banner 
 */
@property(nonatomic,strong)BUNativeExpressBannerView *csjBanner;

/**
        信息流模板
 */
@property (nonatomic, strong) BUNativeExpressAdManager *csjNativeExpressAd;

/**
        信息流模板
 */
@property (nonatomic, strong) BUNativeAdsManager *csjNativeAd;

#endif
@end


@implementation BXMCSJManager

-(NSError *)getNoCSJLibSDKError
{
    NSError *error = [NSError errorWithDomain:NSCocoaErrorDomain code:11108 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"该项目未导入穿山甲SDK，如需使用，请导入穿山甲包"], NSLocalizedDescriptionKey,nil]];
    return error;
}
#pragma mark ----------穿山甲注册
/// 穿山甲注册注册
-(void)csjRegistWithAppId:(NSString *)appId
{
#if BXM_CSJCLASS_EXIST
    [BUAdSDKManager setAppID:appId];
    [BUAdSDKManager setIsPaidApp:NO];
#endif

}

/**
*************************************************************************************************************************
    MARK:-------------------开屏模块
*********************************************  */
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
                      superVC:(UIViewController *)vc
{

    NSLog(@"_____CSJ_%d",BXM_CSJCLASS_EXIST);
#if BXM_CSJCLASS_EXIST
    [self csjRegistWithAppId:appId];
    self.csjSplsh = [[BUSplashAdView alloc] initWithSlotID:adId frame:[UIScreen mainScreen].bounds];
    self.csjSplsh.tolerateTimeout = time;
    self.csjSplsh.delegate = self;
    [self.csjSplsh  loadAdData];
    self.csjSplsh .rootViewController = vc;
#else

    if ([self.splashDelegate respondsToSelector: @selector(csjAdSplash:didFailWithError:)]) {

        [self.splashDelegate  csjAdSplash:nil didFailWithError:[self getNoCSJLibSDKError]];
    }
#endif
}
/**
    展示穿山甲
 */
-(void)showCSJSplashWithWindow:(UIWindow *)window bottomView:(UIView *)bottomView
{
    
    #if BXM_CSJCLASS_EXIST
    if (self.csjSplsh.superview) {
        [self.csjSplsh removeFromSuperview];
    }
    [self.csjSplsh layoutIfNeeded];
    [window addSubview:self.csjSplsh];

    CGRect rect1 = bottomView.bounds;
    rect1.origin.y = [UIScreen mainScreen].bounds.size.height- bottomView.bounds.size.height;
    bottomView.frame = rect1;
    [self.csjSplsh addSubview:bottomView];
    #else
    if ([self.splashDelegate respondsToSelector: @selector(csjAdSplash:didFailWithError:)]) {

        [self.splashDelegate csjAdSplash:nil didFailWithError:[self getNoCSJLibSDKError]];
       }
    #endif
}


#pragma mark _________CSJDelegate

#if BXM_CSJCLASS_EXIST
//加载成功
-(void)splashAdDidLoad:(BUSplashAdView *)splashAd
{
    
    if ([self.splashDelegate respondsToSelector:@selector(csjAdSplashAdDidLoad:)]) {
        [self.splashDelegate csjAdSplashAdDidLoad:splashAd];
    }
}
//加载失败
- (void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError *)error
{
    if ([self.splashDelegate respondsToSelector:@selector(csjAdSplash:didFailWithError:)]) {
        [self.splashDelegate csjAdSplash:splashAd didFailWithError:error];
    }
}

//视图显示
- (void)splashAdWillVisible:(BUSplashAdView *)splashAd
{
    if ([self.splashDelegate respondsToSelector:@selector(csjAdSplashVisible:)]) {
        [self.splashDelegate csjAdSplashVisible:splashAd];
    }

}
//视图关闭
- (void)splashAdDidClose:(BUSplashAdView *)splashAd
{

     [splashAd removeFromSuperview];
    if ([self.splashDelegate respondsToSelector:@selector(csjAdSplashClose:)]) {
        [self.splashDelegate csjAdSplashClose:splashAd];
    }

}
//视图点击
- (void)splashAdDidClick:(BUSplashAdView *)splashAd
{

    [splashAd removeFromSuperview];
    if ([self.splashDelegate respondsToSelector:@selector(csjAdSplashDidClick:)]) {
        [self.splashDelegate csjAdSplashDidClick:splashAd];
    }

}
//视图将要关闭
- (void)splashAdWillClose:(BUSplashAdView *)splashAd
{
    [splashAd removeFromSuperview];

}

#endif
/**
 *************************************************************************************************************************
     MARK:-------------------插屏模块
 *********************************************  */

/**
 加载插屏
 @param appId 应用Id
 @param adId 广告位Id
 @param size 广告 size
 */
-(void)loadCSJIntertitialAppId:(NSString *)appId
                          adId:(NSString *)adId
                        adSize:(CGSize )size
{
#if BXM_CSJCLASS_EXIST

    [self csjRegistWithAppId:appId];
    self.csjInterstitialAd = [[BUNativeExpressInterstitialAd alloc] initWithSlotID:adId adSize:size];
    self.csjInterstitialAd.delegate = self;
    [self.csjInterstitialAd loadAdData];

#else
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAd:didFailWithError:)]) {
        [self.interstialDelegate csjInterstitialAd:nil didFailWithError:[self getNoCSJLibSDKError]];
    }
#endif
   
}
/**
    展示开屏
 */
-(void)presentInterstitialFromController:(UIViewController *)controller
{
   #if BXM_CSJCLASS_EXIST
    
    [self.csjInterstitialAd showAdFromRootViewController:controller];

    #else
        if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAd:didFailWithError:)]) {
            [self.interstialDelegate csjInterstitialAd:nil didFailWithError:[self getNoCSJLibSDKError]];
        }
    #endif
}

#pragma mark ---------BUInterstitialAdDelegate
#if BXM_CSJCLASS_EXIST
//视图关闭
- (void)nativeExpresInterstitialAdDidClose:(BUNativeExpressInterstitialAd *)interstitialAd {
      
    
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAdClose:)]) {
        [self.interstialDelegate csjInterstitialAdClose:interstitialAd];
    }

}
/**
 This method is called when interstitial ad is clicked.
 */
- (void)nativeExpresInterstitialAdDidClick:(BUNativeExpressInterstitialAd *)interstitialAd
{
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAdDidClick:)]) {
        [self.interstialDelegate csjInterstitialAdDidClick:interstitialAd];
    }
   
}

//广告加载成功
- (void)nativeExpresInterstitialAdRenderSuccess:(BUNativeExpressInterstitialAd *)interstitialAd {
    NSLog(@"interstitialAd data load sucess");
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAdDidLoad:)]) {
        [self.interstialDelegate csjInterstitialAdDidLoad:interstitialAd];
    }
}
/**
 This method is called when interstitial ad slot will be showing.
 */
- (void)nativeExpresInterstitialAdWillVisible:(BUNativeExpressInterstitialAd *)interstitialAd
{
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAdVisible:)]) {
           [self.interstialDelegate csjInterstitialAdVisible:interstitialAd];
       }
}

- (void)nativeExpresInterstitialAd:(BUNativeExpressInterstitialAd *)interstitialAd didFailWithError:(NSError *)error {
  
    if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAd:didFailWithError:)]) {
              [self.interstialDelegate csjInterstitialAd:interstitialAd didFailWithError:error];
    }
}

- (void)nativeExpresInterstitialAdRenderFail:(BUNativeExpressInterstitialAd *)interstitialAd error:(NSError *)error
{
   if ([self.interstialDelegate respondsToSelector:@selector(csjInterstitialAd:didFailWithError:)]) {
                [self.interstialDelegate csjInterstitialAd:interstitialAd didFailWithError:error];
      }
}
#endif

/**
*************************************************************************************************************************
    MARK:-------------------Banner模块
*********************************************  */


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
              bannerFrame:(CGRect )frame
{
   
#if BXM_CSJCLASS_EXIST
    [self csjRegistWithAppId:appId];
    if (self.csjBanner.superview) {
        [self.csjBanner removeFromSuperview];
        self.csjBanner = nil;
    }
    
    self.csjBanner = [[BUNativeExpressBannerView alloc] initWithSlotID:adId rootViewController:controller adSize:frame.size IsSupportDeepLink:YES];
    self.csjBanner.delegate = self;

    self.csjBanner.frame = frame;
    [self.csjBanner loadAdData];
#else
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAd:didFailWithError:)]) {
        [self.bannerDelegate csjBannerAd:nil didFailWithError:[self getNoCSJLibSDKError]];
    }
#endif
   
}

/**
 展示banner
 @param showView 添加在显示的View上
 */
-(void)csjbannerShowView:(UIView *)showView
{
#if BXM_CSJCLASS_EXIST
    
    if (self.csjBanner.superview ) {
        [self.csjBanner removeFromSuperview];
    }
    [showView addSubview:self.csjBanner];
#else
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAd:didFailWithError:)]) {
        [self.bannerDelegate csjBannerAd:nil didFailWithError:[self getNoCSJLibSDKError]];
    }
#endif
}
/**
    移除Banner
 */
-(void)csjRemoveBanner
{
#if BXM_CSJCLASS_EXIST
    if (self.csjBanner.superview) {
        
        [self.csjBanner removeFromSuperview];
        self.csjBanner = nil;
    }
#endif
}
#pragma mark ---------BUBannerAdViewDelegate

#if BXM_CSJCLASS_EXIST
/**
 This method is called when bannerAdView ad slot failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView didLoadFailWithError:(NSError *_Nullable)error
{
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAd:didFailWithError:)]) {
           [self.bannerDelegate csjBannerAd:bannerAdView didFailWithError:error];
       }
}

/**
 This method is called when rendering a nativeExpressAdView successed.
 */
- (void)nativeExpressBannerAdViewRenderSuccess:(BUNativeExpressBannerView *)bannerAdView
{
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAdDidLoad:)]) {
        
        [self.bannerDelegate csjBannerAdDidLoad:bannerAdView];
            
    }
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 */
- (void)nativeExpressBannerAdViewRenderFail:(BUNativeExpressBannerView *)bannerAdView error:(NSError * __nullable)error
{
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAd:didFailWithError:)]) {
        [self.bannerDelegate csjBannerAd:bannerAdView didFailWithError:error];
    }
}

/**
 This method is called when bannerAdView ad slot showed new ad.
 */
- (void)nativeExpressBannerAdViewWillBecomVisible:(BUNativeExpressBannerView *)bannerAdView
{
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAdVisible:)]) {
        [self.bannerDelegate csjBannerAdVisible:bannerAdView];
    }
   
}
/**
 This method is called when bannerAdView is clicked.
 */
- (void)nativeExpressBannerAdViewDidClick:(BUNativeExpressBannerView *)bannerAdView
{
    if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAdDidClick:)]) {
           [self.bannerDelegate csjBannerAdDidClick:bannerAdView];
       }
  
}

/**
 This method is called when the user clicked dislike button and chose dislike reasons.
 @param filterwords : the array of reasons for dislike.
 */
- (void)nativeExpressBannerAdView:(BUNativeExpressBannerView *)bannerAdView dislikeWithReason:(NSArray<BUDislikeWords *> *_Nullable)filterwords
{
        [self.csjBanner removeFromSuperview];

       if ([self.bannerDelegate respondsToSelector:@selector(csjBannerAdClose:)]) {

           [self.bannerDelegate csjBannerAdClose:bannerAdView];
       }
}

#endif


/**
*************************************************************************************************************************
    MARK:-------------------全屏视频块
*********************************************  */

/**
 加载穿山甲
 @param appId 应用Id
 @param adId 广告Id
 */
-(void)loadCSJFullVideoAppId:(NSString *)appId
                    adId:(NSString *)adId
{
#if BXM_CSJCLASS_EXIST
   
        [self csjRegistWithAppId:appId];

        self.csjFullScreen = [[BUNativeExpressFullscreenVideoAd alloc] initWithSlotID:adId];
        self.csjFullScreen.delegate = self;
        [self.csjFullScreen loadAdData];
#else
        if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAd:didFailWithError:)]) {
               [self.fullVideoDelegate csjFullScreenVideoAd:nil didFailWithError:[self getNoCSJLibSDKError]];
           }
#endif
    
}
/**
 展示全屏视频
 @param vc 跳转控制器
 */
-(void)presentCSJFullVideoFromeController:(UIViewController *)vc
{
#if BXM_CSJCLASS_EXIST
        [self.csjFullScreen showAdFromRootViewController:vc];
#else
        if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAd:didFailWithError:)]) {
               [self.fullVideoDelegate csjFullScreenVideoAd:nil didFailWithError:[self getNoCSJLibSDKError]];
           }
#endif
}

#pragma mark -----------BUNativeExpressFullscreenVideoAdDelegate
#if BXM_CSJCLASS_EXIST
/**
 This method is called when video ad material loaded successfully.
 */
- (void)nativeExpressFullscreenVideoAdDidLoad:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoA
{
    
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressFullscreenVideoAd:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAd:didFailWithError:)]) {
        [self.fullVideoDelegate csjFullScreenVideoAd:fullscreenVideoAd didFailWithError:error];
    }
}

/**
 This method is called when rendering a nativeExpressAdView successed.
   视频渲染成功
 */
- (void)nativeExpressFullscreenVideoAdViewRenderSuccess:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd
{
}

/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
    视频渲染失败
 */
- (void)nativeExpressFullscreenVideoAdViewRenderFail:(BUNativeExpressFullscreenVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdRenderFail:didFailWithError:)]) {
        [self.fullVideoDelegate csjFullScreenVideoAdRenderFail:rewardedVideoAd didFailWithError:error];
    }
}

/**
 This method is called when video cached successfully.
 */
- (void)nativeExpressFullscreenVideoAdDidDownLoadVideo:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdDidLoad:)]) {
      [self.fullVideoDelegate csjFullScreenVideoAdDidLoad:fullscreenVideoAd];
    }
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressFullscreenVideoAdDidVisible:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdVisible:)]) {
            [self.fullVideoDelegate csjFullScreenVideoAdVisible:fullscreenVideoAd];
        }
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressFullscreenVideoAdDidClick:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdDidClick:)]) {
            [self.fullVideoDelegate csjFullScreenVideoAdDidClick:fullscreenVideoAd];
        }
}

/**
 This method is called when the user clicked skip button.
 */
- (void)nativeExpressFullscreenVideoAdDidClickSkip:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd
{
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdPlayUnFinish:)]) {
        [self.fullVideoDelegate csjFullScreenVideoAdPlayUnFinish:fullscreenVideoAd];
    }
}


/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressFullscreenVideoAdDidClose:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd
{
  
    if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdClose:)]) {
        [self.fullVideoDelegate csjFullScreenVideoAdClose:fullscreenVideoAd];
    }
}

/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressFullscreenVideoAdDidPlayFinish:(BUNativeExpressFullscreenVideoAd *)fullscreenVideoAd didFailWithError:(NSError *_Nullable)error
{
     if (error == nil) {
    //          NSLog(@"________________视屏视屏播放结束");
            if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdPlayFinish:)]) {
                [self.fullVideoDelegate csjFullScreenVideoAdPlayFinish:fullscreenVideoAd];
            }
        }else
        {
    //          NSLog(@"________________视屏播放未结束");
            if ([self.fullVideoDelegate respondsToSelector:@selector(csjFullScreenVideoAdPlayUnFinish:)]) {
                [self.fullVideoDelegate csjFullScreenVideoAdPlayUnFinish:fullscreenVideoAd];
            }
        }
}
#endif

/**
*************************************************************************************************************************
    MARK:-------------------激励视频模块
*********************************************  */
/**
 加载穿山甲
 @param appId 应用Id
 @param adId 广告Id
 */
-(void)loadCSJRewardVideoAppId:(NSString *)appId
                          adId:(NSString *)adId
{
#if BXM_CSJCLASS_EXIST
   
    [self csjRegistWithAppId:appId];
    BURewardedVideoModel *rewardModel = [[BURewardedVideoModel alloc] init];
    rewardModel.userId = [[NSUUID UUID] UUIDString];;
    
    self.csjRewardVideo = [[BUNativeExpressRewardedVideoAd alloc] initWithSlotID:adId rewardedVideoModel:rewardModel];
    self.csjRewardVideo.delegate = self;
    [self.csjRewardVideo loadAdData];
#else
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAd:didFailWithError:)]) {
        [self.rewardVideoDelegate csjRewardVideoAd:nil didFailWithError:[self getNoCSJLibSDKError]];
        
    }
#endif
}
/**
 展示激励视频
 @param controller 控制器
 */
-(void)showCSJRewardVideoFromController:(UIViewController *)controller
{
#if BXM_CSJCLASS_EXIST
    [self.csjRewardVideo showAdFromRootViewController:controller];
#else
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAd:didFailWithError:)]) {
        [self.rewardVideoDelegate csjRewardVideoAd:nil didFailWithError:[self getNoCSJLibSDKError]];
    }
#endif
}

#pragma mark -------BUNativeExpressRewardedVideoAdDelegate

#if BXM_CSJCLASS_EXIST
/**
 This method is called when video ad material loaded successfully.
 */
- (void)nativeExpressRewardedVideoAdDidLoad:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
//    {
//        "request_id" = "084C1487-8A49-41E4-A6AF-CCA8FCC2DD37u1694";
//        "tag_id" = 83b87324856e62185f2260db519f1762;  梦幻家园
//    }
//    {
//        "request_id" = "63DFDA35-686E-497F-A7BA-E26D48213644u2738";
//        "tag_id" = 3f85ec0077e5d83da65e3dd77a43a872; 叮咚
//    }
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdDidLoad:)]) {
        [self.rewardVideoDelegate csjRewardVideoAdDidLoad:rewardedVideoAd];
    }
}

/**
 This method is called when video ad materia failed to load.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAd:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAd:didFailWithError:)]) {
        [self.rewardVideoDelegate csjRewardVideoAd:rewardedVideoAd didFailWithError:error];
    }
}

/**
 This method is called when cached successfully.
 */
- (void)nativeExpressRewardedVideoAdDidDownLoadVideo:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    
}

/**
 This method is called when rendering a nativeExpressAdView successed.
   视频渲染成功s之后再调我们自己的代理
 */
- (void)nativeExpressRewardedVideoAdViewRenderSuccess:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    
}
/**
 This method is called when a nativeExpressAdView failed to render.
 @param error : the reason of error
 
 */
- (void)nativeExpressRewardedVideoAdViewRenderFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd error:(NSError *_Nullable)error
{
   if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdRenderFail:didFailWithError:)]) {
       [self.rewardVideoDelegate csjRewardVideoAdRenderFail:rewardedVideoAd didFailWithError:error];
   }
}

/**
 This method is called when video ad slot has been shown.
 */
- (void)nativeExpressRewardedVideoAdDidVisible:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{

    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdVisible:)]) {
        [self.rewardVideoDelegate csjRewardVideoAdVisible:rewardedVideoAd];
    }
}

/**
 This method is called when video ad is closed.
 */
- (void)nativeExpressRewardedVideoAdDidClose:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdClose:)]) {
              [self.rewardVideoDelegate csjRewardVideoAdClose:rewardedVideoAd];
          }
    
}

/**
 This method is called when video ad is clicked.
 */
- (void)nativeExpressRewardedVideoAdDidClick:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdDidClick:)]) {
           [self.rewardVideoDelegate csjRewardVideoAdDidClick:rewardedVideoAd];
       }
     
}


/**
 This method is called when video ad play completed or an error occurred.
 @param error : the reason of error
 */
- (void)nativeExpressRewardedVideoAdDidPlayFinish:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd didFailWithError:(NSError *_Nullable)error
{
    if (error == nil) {
          
          if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdPlayFinish:)]) {
              [self.rewardVideoDelegate csjRewardVideoAdPlayFinish:rewardedVideoAd];
          }
        
       }else{
         
           if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoAdPlayUnFinish:)]) {
               [self.rewardVideoDelegate csjRewardVideoAdPlayUnFinish:rewardedVideoAd];
           }
           
          ;
       }
}

/**
 Server verification which is requested asynchronously is succeeded. now include two v erify methods:
      1. C2C need  server verify  2. S2S don't need server verify
 @param verify :return YES when return value is 2000.
   视频验证成功
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidSucceed:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd verify:(BOOL)verify
{
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoPlayFinishVerify:)]) {
           [self.rewardVideoDelegate csjRewardVideoPlayFinishVerify:verify];
       }
}

/**
 Server verification which is requested asynchronously is failed.
 Return value is not 2000.
  视频验证是被
 */
- (void)nativeExpressRewardedVideoAdServerRewardDidFail:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd
{
    if ([self.rewardVideoDelegate respondsToSelector:@selector(csjRewardVideoPlayFinishVerify:)]) {
           [self.rewardVideoDelegate csjRewardVideoPlayFinishVerify:NO];
       }
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)nativeExpressRewardedVideoAdDidCloseOtherController:(BUNativeExpressRewardedVideoAd *)rewardedVideoAd interactionType:(BUInteractionType)interactionType
{
    
}

#endif


/**
*************************************************************************************************************************
    MARK:-------------------信息流模板模块
*********************************************  */
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
                    controller:(UIViewController *)controller
{
    
#if BXM_CSJCLASS_EXIST
    self.rootController = controller;
    [self csjRegistWithAppId:appId];
    BUAdSlot *slot = [[BUAdSlot alloc] init];
    slot.ID = adId;
    slot.AdType = BUAdSlotAdTypeFeed;
    slot.position = BUAdSlotPositionFeed;
    slot.imgSize = [BUSize sizeBy:(BUProposalSize)imgSize];
    slot.isSupportDeepLink = YES;
    self.csjNativeExpressAd = [[BUNativeExpressAdManager alloc] initWithSlot:slot adSize:adSize];
    self.csjNativeExpressAd.delegate = self;
   
#endif
}

/**
 加载信息流广告
 @param count 所需加载的条数
*/
- (void)loadNativeExpressAdCount:(NSInteger)count
{
#if BXM_CSJCLASS_EXIST
     [self.csjNativeExpressAd loadAd:count];
#else
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdFailToLoad:error:)]) {
        [self.nativeExpressDelegate csjNativeExpressAdFailToLoad:nil error:[self getNoCSJLibSDKError]];
       }
#endif
}

#pragma mark ----------nativeExpressDelegate

#if BXM_CSJCLASS_EXIST
- (void)nativeExpressAdSuccessToLoad:(BUNativeExpressAdManager *)nativeExpressAd views:(NSArray<__kindof BUNativeExpressAdView *> *)views
{
    
    [views enumerateObjectsUsingBlock:^(__kindof BUNativeExpressAdView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.rootViewController = self.rootController;
        [obj render];
    }];
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdSuccessToLoad:views:)]) {
        [self.nativeExpressDelegate csjNativeExpressAdSuccessToLoad:nativeExpressAd views:views];
    }
}

- (void)nativeExpressAdFailToLoad:(BUNativeExpressAdManager *)nativeExpressAd error:(NSError *)error
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdFailToLoad:error:)]) {
        [self.nativeExpressDelegate csjNativeExpressAdFailToLoad:nativeExpressAd error:error];
    }
    
}
-(void)nativeExpressAdViewRenderSuccess:(BUNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdViewRenderSuccess:)]) {
           [self.nativeExpressDelegate csjNativeExpressAdViewRenderSuccess:nativeExpressAdView];
       }
}

-(void)nativeExpressAdViewRenderFail:(BUNativeExpressAdView *)nativeExpressAdView error:(NSError *)error
{
     if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdViewRenderFail:error:)]) {
              [self.nativeExpressDelegate csjNativeExpressAdViewRenderFail:nativeExpressAdView error:error];
    }
}

-(void)nativeExpressAdViewWillShow:(BUNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdViewWillShow:)]) {
        [self.nativeExpressDelegate csjNativeExpressAdViewWillShow:nativeExpressAdView];
       }
}
-(void)nativeExpressAdViewDidClick:(BUNativeExpressAdView *)nativeExpressAdView
{
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdViewDidClick:)]) {
                 [self.nativeExpressDelegate csjNativeExpressAdViewDidClick:nativeExpressAdView];
       }
}

- (void)nativeExpressAdView:(BUNativeExpressAdView *)nativeExpressAdView dislikeWithReason:(NSArray<BUDislikeWords *> *)filterWords
{
    
    if ([self.nativeExpressDelegate respondsToSelector:@selector(csjNativeExpressAdViewDidClose:)]) {
        [self.nativeExpressDelegate csjNativeExpressAdViewDidClose:nativeExpressAdView];
    }
}
#endif


@end


