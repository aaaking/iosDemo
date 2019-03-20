//
//  GBSDKDefines.h
//  GBSDK
//
//  Created by bruce on 16/3/8.
//  Copyright © 2016年 GameBegin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

//登陆相关的
extern NSString *const GB_LOGIN_NOTIFICATION;              //登录
extern NSString *const GB_LOGOUT_NOTIFICATION;             //退出
extern NSString *const GB_SWITCHACCOUNT_NOTIFICATION;      //切换账号
extern NSString *const GB_WEBVIEW_CLOSE_NOTIFICATION;      //关闭webview的通知，内部使用
extern NSString *const GB_WEBVIEW_LOGOUT_NOTIFICATION;     //页面webview，点击退出
extern NSString *const GB_WEBVIEW_CUSTOMER_NOTIFICATION;   //平台键点开的页面关闭通知

extern NSString *const GB_INFO_VIEW_CLOSE_NOTIFICATION;   //关闭InfoView


extern NSString *const GB_TIPS_WEBVIEW_CLOSE_NOTIFICATION;  //TIPS页面 关闭

//GameCenter
extern NSString *const GB_PRESENT_AUTHVIEWCONTROLLER_NOTIFICATION;
extern NSString *const GB_LOCALPALYER_AUTH_NOTIFICATION;
extern NSString *const GB_GAMECENTER_LOGIN;

extern NSString *const NSLOGFLAG;
extern NSString *const GBREMOVETRANSACTIONS_NOTIFICATION;

//充值
extern NSString *const GB_ROLE_ID;
extern NSString *const GB_ROLE_NAME;
extern NSString *const GB_ROLE_LEVEL;
extern NSString *const GB_ROLE_COIN;
extern NSString *const GB_ROLE_MENEY;


//CS选项
extern NSString *const GB_USERINFO;                 //用户信息
extern NSString *const GB_FEEDBACK;                 //用户反馈
extern NSString *const GB_BULLENTIN;                //SDK公告

//
extern NSString *const GB_LOGIN_JSOC;               //登录
extern NSString *const GB_LOGIN_COLSE_JSOC;         //web关闭
extern NSString *const GB_LOGIN_FB_JSOC;            //FB登陆回调
extern NSString *const GB_LOGIN_GOOGLE_JSOC;        //Google登陆回调
extern NSString *const GB_LOGOUT_JSOC;              //注销
extern NSString *const GB_SHARE_WECHAT_JSOC;        //微信分享回调
extern NSString *const GB_REVIEW_STAR_JSOC;
extern NSString *const GB_REMOVE_TRANSCATIONS;      //删除TRANSCATIONS
extern NSString *const GB_SIMULATED_LOGIN_JSOC;     //模拟登录


typedef NS_ENUM(NSInteger, GBSTATUS) {
    message_fail = 0,                       //失败
    message_success = 1,                    //成功
    message_buying_error,                   //有其他订单购买进行中
    message_product_info_error,             //商品信息获取失败
    message_get_order_error,                //用户下单失败
//    message_user_cancel,                  //用户取消支付
    message_user_paid,                      //用户完成支付
    message_user_paid_error,                //用户支付失败
    message_issue_success,                  //物品下发成功
    message_issue_error,                    //物品下发失败
    
    message_web_logout = 100,               //webview注销
};

typedef NS_ENUM(NSInteger, GBLoginType) {
    GB_LOGIN_UNKOWN = 0,        //未知
    GB_LOGIN_GUEST = 1,         //游客账号登录
    GB_LOGIN_GB = 2,            //GameBegin账号登录
    GB_LOGIN_GAMECENTER =3,     //gamecenter
    GB_LOGIN_GOOGLEPLAY = 4,    //googleplay
    GB_LOGIN_FB = 5,            //Facebook
    GB_LOGIN_LINE = 6,          //Line
    GB_LOGIN_TWITTER = 7,       //twitter
    GB_LOGIN_QQ = 8,            //QQ
    GB_LOGIN_WECHAT = 9,        //微信
};

//回调数据，默认返回失败信息
@interface GBCallbackModel : NSObject

extern NSString *const GB_CALLBACK_SUCCESS;      //回调成功
extern NSString *const GB_CALLBACK_FAIL;         //回调失败

@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) GBSTATUS status;
@property (nonatomic, strong) id data;

@end

typedef void  (^GBCallbackBlock)(GBCallbackModel *callbackModel);


@interface GBSDKDefines : NSObject


@end


#pragma mark - 语言类型
//zh-cn 简体中文
//zh-hk 繁体中文
//en 英文
//ja  日文
//th  泰文
//vi  越南
//id  印尼
//de  德文
typedef NS_ENUM(NSInteger, GBLanguageType) {
    GB_LANGUAGE_SYSTEM = 0,//取设备的系统语言
    GB_LANGUAGE_CN,//简体中文
    GB_LANGUAGE_HK,//繁体中文
    GB_LANGUAGE_EN,//英文
    GB_LANGUAGE_JA,//日文
    GB_LANGUAGE_TH,//泰文
    GB_LANGUAGE_VI,//越南文
    GB_LANGUAGE_ID,//印尼文
    GB_LANGUAGE_DE,//德文
};
#pragma mark - 分享类别

typedef NS_ENUM(NSInteger, GBShareType){
    
    GB_SHAREFACEBOOKLINK = 1,    //facebook link
    GB_SHAREFACEBOOKIMAGE,       //facebook image
    GB_SHAREINSTAGRAM,           //instagram
    GB_SHARELINE,                //line
    GB_SHAREWXSESSIONLINK,       //微信会话 link
    GB_SHAREWXSESSIONIMAGE,      //微信会话 image
    GB_SHAREWXTIMELINELINK,      //微信朋友圈 link
    GB_SHAREWXTIMELINEIMAGE,     //微信朋友圈 image

    GB_SHAREFACEBOOK,           //facebook
    GB_SHAREWXSESSION,          //微信会话
    GB_SHAREWXTIMELINE,         //微信朋友圈
    
    GB_SHARETWITTER,            //twitter

};

