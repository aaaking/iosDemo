//
//  ViewController.m
//  GameBeginSDK
//
//  Created by bruce on 2017/8/17.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import "LoginViewController.h"
#import "GameBeginViewController.h"
#import <GBSDK/GBSDK.h>

@interface LoginViewController () {
    UIButton *_playBtn;
    
}

//@property(nonatomic, strong) NSArray *list;

@end

@implementation LoginViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
    
    [self login];
    [self logoutCallback];
}

- (void)initSDK {
    //查看delegate.m中的initSDK方法
    //默认横版的，竖版的要设置这个
    //[[GBSDK shareInstance] setScreenOrientation:UIInterfaceOrientationPortrait];
    
    //[[GBSDK shareInstance] debugMod];//测试网络，注释掉为正式网络
    //[[GBSDK shareInstance] log];     //打印日志，注释掉为不打日志
    
    
    //sample com.gamebegin.sample eling@gamebegin.com
    //语言设置
    [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_DE];
    [[GBSDK shareInstance] setGameID:@"72" sdkSecret:@"cVOOTUHKr4qyVJta"];
}

//注销接口，用户中心注销，cookie失效注销，都会回调这里
- (void)logoutCallback {
    [[GBSDK shareInstance] logoutCallback:^(GBCallbackModel *callbackModel) {
        
        if(callbackModel.status == 1) {
            [self login];
        }
    }];
}

- (void)login {
    [[GBSDK shareInstance] login:^(GBCallbackModel *callbackModel) {
        //登录回调
        //NSLog(@"callbackModel = %ld", (long)callbackModel.status);
        //NSLog(@"callbackModel = %@", callbackModel.message);
        //NSLog(@"callbackModel = %@", callbackModel.data);
        //如果登录成功
        if(callbackModel.status == 1) {
            GBUserModel *userModel = callbackModel.data;
            NSLog(@"userModel.uid = %@", userModel.uid);
            NSLog(@"userModel.username = %@", userModel.username);
            NSLog(@"userModel.token = %@", userModel.token);
            NSLog(@"userModel.isBindEmail = %hhu", userModel.isBindEmail);
        }else{
            //alert 失败
        }
    }];
}

- (void)logout {
    [[GBSDK shareInstance] logout];
}

- (void)buy {
    NSString *productID = @"gamebegin_gold_60";
    NSString *paramString = @"id10086透传参数,一般传自己的订单号";
    [[GBSDK shareInstance] buyWithProductId:productID
                                   quantity:1
                                paramString:paramString
                                showloading:YES
                              callbackBlock:^(GBCallbackModel *callbackModel) {
        NSLog(@"status = %ld",(long)callbackModel.status);
        NSLog(@"message = %@",callbackModel.message);
        NSLog(@"data = %@",callbackModel.data);
        //处理方式一，只处理成功和失败的
        if(callbackModel.status == message_issue_success) {
            //物品下发或者其他情况，
            NSLog(@"物品已经下发了");
        }else {
            //其他情况,表示用户购买失败
            NSLog(@"购买失败");
        }
    }];
}

- (void)roleInfo {
    if([GBSDK shareInstance].isLogin) {
        //选择区服，知道用户的角色信息的时候再调用，这边作为测试，写到这边。
        NSString *serverId = @"第100服";
        NSString *roleId = @"id123456";
        NSString *roleName = @"Name-孙悟空";
        NSString *roleLevel = @"level-99";//最好传的是整形类型
        
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:2];
        [dic setObject:roleName forKey:GB_ROLE_NAME];//角色名称
        [dic setObject:roleLevel forKey:GB_ROLE_LEVEL];//角色等级
        [[GBSDK shareInstance] serverID:serverId andRoleID:roleId andInfo:dic];
    }
}

- (void)otherMethod {
    if([GBSDK shareInstance].isLogin) {
        GameBeginViewController *viewController = [[GameBeginViewController  alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }else {
        [self login];
    }
}


-(BOOL)prefersStatusBarHidden {
    return YES;
}
//隐藏NavigationBar
-(void) viewWillAppear:(BOOL)animated{
    
    [self.navigationController setNavigationBarHidden:YES animated:NO]; //设置隐藏
    [super viewWillAppear:animated];
}

-(void) viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [super viewWillDisappear:animated];
}

#pragma mark - UI
- (void)initUI {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    UIImage *image = [UIImage imageNamed:@"bg_image"];
    [imageView setImage:image];
    [self.view addSubview:imageView];
    
    
    CGFloat x = [UIScreen mainScreen].bounds.size.width/2;
    CGFloat y = [UIScreen mainScreen].bounds.size.height/2 + 25;
    CGFloat height = 40;
    CGFloat width = 200;
    UIButton *initBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    initBtn.frame =CGRectMake(x, y, width, height);
    initBtn.center = CGPointMake(x, y-150);
    [initBtn setTitle:@"初始化" forState:UIControlStateNormal];
    initBtn.backgroundColor = [UIColor colorWithRed:0.992 green:0.392 blue:0.380 alpha:1.00];
    initBtn.layer.cornerRadius = 5;
    [initBtn addTarget:self action:@selector(initSDK) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:initBtn];
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame =CGRectMake(x, y, width, height);
    loginBtn.center = CGPointMake(x, y-100);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor colorWithRed:0.525 green:0.875 blue:0.416 alpha:1.00];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    

    
    UIButton *logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logoutBtn.frame =CGRectMake(x, y, width, height);
    logoutBtn.center = CGPointMake(x, y-50);
    [logoutBtn setTitle:@"注销" forState:UIControlStateNormal];
    logoutBtn.backgroundColor = [UIColor colorWithRed:0.318 green:0.729 blue:0.949 alpha:1.00];
    logoutBtn.layer.cornerRadius = 5;
    [logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logoutBtn];
    
    
    UIButton *roleInfoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    roleInfoBtn.frame =CGRectMake(x, y, width, height);
    roleInfoBtn.center = CGPointMake(x, y);
    [roleInfoBtn setTitle:@"用户角色信息" forState:UIControlStateNormal];
    roleInfoBtn.backgroundColor = [UIColor colorWithRed:0.969 green:0.651 blue:0.314 alpha:1.00];
    roleInfoBtn.layer.cornerRadius = 5;
    [roleInfoBtn addTarget:self action:@selector(roleInfo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:roleInfoBtn];
    
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    buyBtn.frame =CGRectMake(x, y, width, height);
    buyBtn.center = CGPointMake(x, y+50);
    [buyBtn setTitle:@"购买" forState:UIControlStateNormal];
    buyBtn.backgroundColor = [UIColor colorWithRed:0.835 green:0.573 blue:0.898 alpha:1.00];
    buyBtn.layer.cornerRadius = 5;
    [buyBtn addTarget:self action:@selector(buy) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
    
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _playBtn.frame =CGRectMake(x, y, width, height);
    _playBtn.center = CGPointMake(x, y+100);
    [_playBtn setTitle:@"其他接口" forState:UIControlStateNormal];
    _playBtn.backgroundColor = [UIColor colorWithRed:0.525 green:0.875 blue:0.416 alpha:1.00];
    _playBtn.layer.cornerRadius = 5;
    [_playBtn addTarget:self action:@selector(otherMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_playBtn];
}
@end
