//
//  GetuiBXAdObject.h
//  BXSDK
//
//  Created by ak on 2020/8/14.
//  Copyright © 2020 ak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetuiBXAdObject : NSObject

/// 广告位Id
@property (nonatomic, copy) NSString *adId;
/// 广告标题
@property (nonatomic, copy) NSString *title;

/// 广告描述
@property (nonatomic, copy) NSString *desc;

/// App图标
@property (nonatomic, copy) NSString *icon;

/// App评分（5星制度）
@property (nonatomic, assign) CGFloat score;

/// 广告展示格式
@property (nonatomic, assign) int mode;

/// 图片集合
@property (nonatomic, strong) NSArray<NSString *> *imgArray;

/// 图片尺寸
@property (nonatomic, assign) CGSize imgSize;

/// 交互按钮文案（该字段在部分广告类型中可能为空）
@property (nonatomic, copy) NSString *buttonText;

/// 视频时长（单位ms）
@property (nonatomic, assign) CGFloat videoDuration;

@end

NS_ASSUME_NONNULL_END
