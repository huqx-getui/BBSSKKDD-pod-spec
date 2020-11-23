//
//  GetuiBXSdkKey.h
//  BXSDK
//
//  Created by ak on 2020/8/21.
//  Copyright © 2020 ak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetuiBXSdkKey : NSObject

//个推变现sdk AppId
@property(nonatomic, copy) NSString *getui;

//广点通
@property(nonatomic, copy) NSString *gdt;

//穿山甲
@property(nonatomic, copy) NSString *csj;

//百度联盟
@property(nonatomic, copy) NSString *bd;

//InMob
@property(nonatomic, copy) NSString *inmobi;

@end

NS_ASSUME_NONNULL_END
