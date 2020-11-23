//
//  GetuiBXAdTouchView.h
//  BXSDK
//
//  Created by ak on 2020/8/28.
//  Copyright © 2020 ak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GetuiBXComponentDelegate;

@interface GetuiBXAdTouch : NSObject

@property (nonatomic, weak) id<GetuiBXComponentDelegate> gtDelegate;

- (void)registerData:(GetuiBXAdObject *)dataObject
      viewController:(UIViewController *)viewController
      clickableViews:(NSArray<UIView *> *)clickableViews;
@end

NS_ASSUME_NONNULL_END
