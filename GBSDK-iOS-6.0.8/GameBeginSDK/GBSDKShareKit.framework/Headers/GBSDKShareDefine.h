//
//  GBSDKShareDefine.h
//  GBSDKShareKit
//
//  Created by bruce on 2017/11/21.
//  Copyright © 2017年 GameBegin. All rights reserved.
//


#import <UIKit/UIKit.h>

//分享类别
typedef NS_ENUM (NSInteger, GBShareType){
    GB_SHARE_FACEBOOKLINK = 1,    //facebook link
    GB_SHARE_FACEBOOKIMAGE,       //facebook image
    GB_SHARE_INSTAGRAM,           //instagram
    GB_SHARE_LINE,                //line
    GB_SHARE_TWITTER,             //twitter
    GB_SHARE_GOOGLE,
};

typedef void (^GBShareBlock)(GBShareType type, BOOL isSuccess);

@interface GBSDKShareDefine : NSObject

+ (GBSDKShareDefine *)shareInstance;

- (UIViewController *)getCurrentVC;

@end

