//
//  GBSDKShareKit.h
//  GBSDKShareKit
//
//  Created by bruce on 2017/11/17.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBSDKShareDefine.h"

// In this header, you should import all the public headers of your framework using statements like
//#import <GBSDKShareKit/PublicHeader.h>

@interface GBSDKShareKit : NSObject

+ (GBSDKShareKit *)shareInstance;

- (void)facebookLink:(NSURL *)url block:(GBShareBlock)block;

- (void)facebookWithImage:(UIImage *)image block:(GBShareBlock)block;

@end

