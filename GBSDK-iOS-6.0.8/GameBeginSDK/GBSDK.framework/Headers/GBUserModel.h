//
//  GBUserModel.h
//  GameBeginSDK
//
//  Created by bruce on 2017/8/18.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GBSDKDefines.h"

@interface GBUserBaseModel : NSObject

//用户信息
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *cookie;
@property (nonatomic, assign) Boolean isBindEmail;
@property (nonatomic, assign) GBLoginType loginType;

- (Boolean)isQLUser;

@end

@interface GBUserModel : GBUserBaseModel


//角色信息
@property (nonatomic, strong) NSString *serverId;
@property (nonatomic, strong) NSString *roleId;
@property (nonatomic, strong) NSString *roleName;
@property (nonatomic, strong) NSString *roleLevel;
@property (nonatomic, strong) NSString *roleCoin;
@property (nonatomic, strong) NSString *roleMoney;

@end
