//
//  GBSDK.h
//  GameBeginSDK
//
//  Created by bruce on 2017/8/18.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <GoogleSignIn/GoogleSignIn.h>
#import "GBSDKDefines.h"
#import "GBUserModel.h"

@interface GBSDK : NSObject

//+ (instancetype)shareInstance;
#pragma mark - 平台基本信息获取 **************************************************

/**
 *  获取GBSDK实例对象
 */
+ (GBSDK *)shareInstance ;

/**
 *  获取SDK的版本号
 */
+ (NSString *)version;


@end

#pragma mark - 平台基本信息 **************************************************

@interface GBSDK(GBInit)

/**
 *  选择相册的时候支持竖屏
 */
- (Boolean)isSupportPortrait;

/**
 *  @brief 初始化我们的SDK
 *
 *  @param gameID 我们平台给出的游戏ID
 *
 *  @param sdkSecret 我们平台给出的游戏sdkSecret密钥
 */
- (void)setGameID:(NSString *)gameID sdkSecret:(NSString *)sdkSecret;

/**
 *  @brief 设置market
 *
 *  @param market 设置市场渠道，如果非Appstore渠道的要求设置，且放到最前面调用
 */
- (void)setMarket:(NSString *)market;

/**
 *  @brief 设置sdkSecret
 *  
 *  @param orientation 屏幕方向默认为：UIInterfaceOrientationLandscapeLeft
 */
- (void)setScreenOrientation:(UIInterfaceOrientation)orientation;

/**
 *  @brief 获取屏幕方向默认为
 *  默认为横屏UIInterfaceOrientationLandscapeLeft
 */
- (UIInterfaceOrientation)getScreenOrientation;

/**
 *  @brief 设置测试环境网络
 *
 */
- (void)debugMod;

/**
 *  @brief 日志打印
 *
 */
- (void)log;

/**
 *  @brief 切换系统语言
 *
 *  @param languageType 语言类型，GBSDKDefines中有声明
 */
- (void)setLanguage:(GBLanguageType)languageType;

/**
 *  @brief 切换系统语言
 *
 *  @param languageString 语言字符串
 */
- (void)language:(NSString *)languageString;
@end


#pragma mark - 平台登录 **************************************************

@interface GBSDK(GBLogin)

/**
 *  @brief 是否登录成功
 *
 */
- (Boolean)isLogin;

/**
 *  @brief 用户登录页面
 *
 */
- (void)login:(GBCallbackBlock)gbBlock;

- (void)login:(Boolean)isCanClose andBlock:(GBCallbackBlock)gbBlock;

/*
 * @brief 用户登录失效的回调，包括注销，用户中心，cookie失效等情况的回调
 */
- (void)logoutCallback:(GBCallbackBlock)gbBlock;

/**
 *  @brief 用户点击退出，不会跳转到登录页面
 *
 */
- (void)logout:(GBCallbackBlock)gbBlock;

/**
 *  @brief 注销的回调使用logoutCallback
 */
- (void)logout;

/**
 *  @brief 用户信息
 *  @param block 用户注销的回调信息
 */
- (void)userInfo:(GBCallbackBlock)block;

/**
 *  @brief 注销的回调使用logoutCallback
 */
- (void)userInfo;

/**
 *  @brief 获取用户信息
 *
 */
- (GBUserModel *)userModel;

/**
 *  @brief 悬浮按钮
 *  position 位置
 */
- (void)floatingButton:(CGPoint)position;

/**
 *  @brief 隐藏选服按钮
 */
- (void)hideFloatingButton;

@end

#pragma mark - 平台统计 **************************************************

@interface GBSDK(GBAnalytics)

/**
 *  @brief 用户选择服务接口
 *
 *  @param serverID 区服id
 *  @param roleID 角色id
 *  @param dic 其他信息
 *
 * NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:5];
 * [dic setObject:@"NameBlueSky" forKey:@"roleName"];//角色名 可以为空
 * [dic setObject:@"99" forKey:@"roleLevel"];//角色等级 可以为空
 * [dic setObject:@"100" forKey:@"roleCoin"];//游戏币（如银两）余额 可以为空
 * [dic setObject:@"9999" forKey:@"roleMoney"];//货币（如元宝）余额 可以为空
 */
- (void)serverID:(NSString *)serverID andRoleID:(NSString *)roleID andInfo:(NSMutableDictionary *)dic;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

//iOS8 or older
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

//iOS9 or newer
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary *)options;

//主要是为了调用相册的问题
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window;

#pragma mark - 结合第三方接口的统计
#pragma mark - 需要开发者手动调用的统计
/**
 *  @brief 开始加载
 */
- (void)startLoading;

/**
 *  @brief 结束加载
 */
- (void)endLoading;

/**
 *  @brief 资源下载开始
 */
- (void)startDownResource;

/**
 *  @brief 资源下载结束
 */
- (void)endDownResource;

/**
 *  @brief 用户热更新开始
 */
- (void)startUpdate;

/**
 *  @brief 用户热更新结束
 */
- (void)endUpdate;

/**
 *  @brief 新手引导开始
 */
- (void)starGuide;

/**
 *  @brief 新手引导结束
 */
- (void)endGuide;

/**
 *  @brief 自定义事件跟踪
 *
 *  @param levelName 等级名称
 *
 */
- (void)level:(NSString *)levelName;

/**
 *  @brief 自定义事件跟踪
 *
 *  @param sceneName 场景名称
 *
 */
- (void)scene:(NSString *)sceneName;

/**
 *  @brief 自定义事件跟踪
 *
 *  @param eventName 事件名称
 *
 */
- (void)trackEvent:(NSString *)eventName;

/**
 *  @brief 自定义事件跟踪
 *
 *  @param eventName 事件名称
 *  @param value 事件的值
 *
 */
- (void)trackEvent:(NSString *)eventName withValue:(NSString *)value;

/**
 *  @brief 自定义事件跟踪
 *
 *  @param eventName 事件名称
 *  @param values 事件的值，字典类型
 *
 */
- (void)trackEvent:(NSString *)eventName withValues:(NSDictionary *)values;

@end

#pragma mark - 游戏客服 **************************************************

@interface GBSDK(GBButton)

/**
 *  游戏客服页面
 *
 *  @param  title 标题
 *  @param  block 回调block
 */
- (void)showGameManager:(NSString *)title block:(GBCallbackBlock)block;

/**
 *  @brief 显示游戏评价
 *
 */
- (void)showReview;

/**
 *  @brief  用户中心
 */
- (void)showUserInfo;

/**
 *  @brief  反馈
 */
- (void)showFeedback;

/**
 *  @brief  公告
 */
- (void)showBulletin;

/**
 *  @brief 根据Url显示网页。
 */
- (void)showWebView:(NSString *)urlString;
    
/**
 *  @brief 是否绑定邮箱了
 *
 */
- (void)isBindEmail:(GBCallbackBlock)block;

@end

#pragma mark - 内购 **************************************************

@interface GBSDK(GBIAP)

- (NSArray *)productsArray;


/**
 *  这个方法只有iap
 *  @param  productId  产品ID
 *  @param  quantity  购买数量
 *  @param  paramString 可以为nil，可以理解为透传参数，
 *                      我们服务端在用户充值成功，通知你们的服务端下发物品，会带这个参数过去。
 *  @param  isLoading 是否使用SDK内部的Loading
 *  @param  block 回调block
 */
- (void)buyWithProductId:(NSString *)productId
                quantity:(NSUInteger )quantity
             paramString:(NSString *)paramString
             showloading:(Boolean)isLoading
           callbackBlock:(GBCallbackBlock)block ;

/**
 *  这个方法只有iap
 *  @param  productId  产品ID
 *  @param  quantity  购买数量
 *  @param  paramString 可以为nil，可以理解为透传参数，
 *                      我们服务端在用户充值成功，通知你们的服务端下发物品，会带这个参数过去。
 *  @param  block 回调block
 */
- (void)buyWithProductId:(NSString *)productId
                quantity:(NSUInteger )quantity
             paramString:(NSString *)paramString
           callbackBlock:(GBCallbackBlock)block;

@end



