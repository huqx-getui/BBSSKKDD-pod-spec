//
//  GetuiBXParamObject.h
//  BXSDK
//
//  Created by ak on 2020/8/17.
//  Copyright © 2020 ak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//MARK: - GetuiBXParamObject

@interface GetuiBXParamObject : NSObject


/// 设置超时时长
/// @param milesecond 毫秒
- (instancetype)timeout:(NSUInteger)milesecond;

@end

NS_ASSUME_NONNULL_END
