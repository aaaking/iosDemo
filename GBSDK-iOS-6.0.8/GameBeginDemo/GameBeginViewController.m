//
//  GameBeginViewController.m
//  GameBeginSDK
//
//  Created by bruce on 2017/9/19.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import "GameBeginViewController.h"
#import "IAPTableViewController.h"
#import "TrackTableTableViewController.h"
#import "ShareViewController.h"
#import <GBSDK/GBSDK.h>
@interface GameBeginViewController ()

@property(nonatomic, strong) NSArray *list;

@end


@implementation GameBeginViewController

- (void)dealloc{
    NSLog(@"GameBeginViewController-dealloc");
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
    CGFloat navHeight = rectOfNavigationbar.size.height;
    if([GBSDK shareInstance].getScreenOrientation == UIInterfaceOrientationPortrait) {
        navHeight += 20;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    
    _list = [[NSArray alloc] initWithObjects:
             @"1登录(★)",@"2退出登录", @"3用户中心(★)",@"4悬浮按钮(★)", @"5选服接口(★)",
             @"6购买事件(★)", @"7事件统计(★)",@"8语言切换\n(多语言游戏)", @"9游戏内评价(★)",
             @"10反馈页面",@"11用户信息页面", @"12分享", @"13显示自定义的WebView",@"14隐藏悬浮按钮",nil];
    
    int columnNum = 5;
    int rowNum = 4;
    if([GBSDK shareInstance].getScreenOrientation == UIInterfaceOrientationPortrait) {
        columnNum = 3;
        rowNum = 5;
    }
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat btnWidth  = screenSize.width / columnNum;
    CGFloat btnHeight = (screenSize.height-navHeight)  / rowNum;
    for (int i = 0 ; i < _list.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        item.frame = CGRectMake((i%columnNum)*btnWidth, (i/columnNum)*btnHeight+navHeight, btnWidth-1, btnHeight-1);
        item.layer.cornerRadius = 5;
        [item.layer setBorderWidth:1.0];
        item.layer.borderColor=[UIColor blackColor].CGColor;
        [item setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [item.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:17.0f]];
        item.titleLabel.numberOfLines = 0;
        NSString *title = _list[i];
        [item setTitle:title forState:UIControlStateNormal];
        item.tag = i;
        
        [item addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:item];
    }
    
    GBUserModel *userModel = [[GBSDK shareInstance] userModel];
    NSLog(@"userModel uid = %@, userName = %@, userToken = %@ roleId = %@ roleName = %@",userModel.uid, userModel.username, userModel.token, userModel.roleId, userModel.roleName);
    
}

- (void)btnAction:(UIButton *)btn {
    
    NSLog(@"%ld",(long)btn.tag);
    switch (btn.tag) {
            
        case 0: {//登陆
            [self loginAction];
            break;
        }
        case 1: {//注销
            
            [[GBSDK shareInstance] logout];
            break;
        }
        case 2: {//用户中心
            if([GBSDK shareInstance].isLogin) {
                [[GBSDK shareInstance] userInfo];
            }else {
                [self loginAction];
            }
            
            break;
        }
        case 3: {//悬浮按钮
            [self floatingButton];
            
            break;
        }
            
        case 4: {//区服信息接口
            if([GBSDK shareInstance].isLogin) {
                
                //选择区服，知道用户的角色信息的时候再调用，这边作为测试，写到这边。
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:5];
                [dic setObject:@"Name-孙悟空" forKey:GB_ROLE_NAME];//角色名 可以为空
                [dic setObject:@"level-99" forKey:GB_ROLE_LEVEL];//角色等级 可以为空
                [dic setObject:@"100" forKey:GB_ROLE_COIN];//游戏币（如银两）余额 可以为空
                [dic setObject:@"9999" forKey:GB_ROLE_MENEY];//货币（如元宝）余额 可以为空
                
                [[GBSDK shareInstance] serverID:@"第100服" andRoleID:@"id123456" andInfo:dic];
            }else {
                [self loginAction];
            }
            
            break;
        }
        case 5: {//购买
            IAPTableViewController *viewController = [[IAPTableViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            
            break;
        }
        case 6: {//统计事件
            TrackTableTableViewController *viewController = [[TrackTableTableViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            
            break;
        }
        case 7: {//多语言的游戏，切换SDK的默认语言
            
            UIAlertController *alertController = [UIAlertController
                                                  alertControllerWithTitle:@"选择哪种语言呢"
                                                  message:nil                                                  preferredStyle:UIAlertControllerStyleAlert ];
            
            UIAlertAction *cn1Action = [UIAlertAction actionWithTitle:@"中文简体" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_CN];
            }];
            [alertController addAction:cn1Action];
            UIAlertAction *cn2Action = [UIAlertAction actionWithTitle:@"中文繁体" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_HK];
            }];
            [alertController addAction:cn2Action];
            
            UIAlertAction *enAction = [UIAlertAction actionWithTitle:@"英文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_EN];
            }];
            [alertController addAction:enAction];
            
            UIAlertAction *thAction = [UIAlertAction actionWithTitle:@"泰文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_TH];
            }];
            [alertController addAction:thAction];
            
            UIAlertAction *inAction = [UIAlertAction actionWithTitle:@"印尼" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_ID];
            }];
            [alertController addAction:inAction];
            
            UIAlertAction *vnAction = [UIAlertAction actionWithTitle:@"越南" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_VI];
            }];
            [alertController addAction:vnAction];
            
            UIAlertAction *deAction = [UIAlertAction actionWithTitle:@"德文" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[GBSDK shareInstance] setLanguage:GB_LANGUAGE_DE];
            }];
            [alertController addAction:deAction];
            
            
            //取消style:UIAlertActionStyleDefault
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:cancelAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
            
            break;
        }
        case 8: {//iOS自带的评价
            [[GBSDK shareInstance] showReview];
            break;
        }
        case 9: {//用户反馈
            
            [[GBSDK shareInstance] showFeedback];
            
            break;
        }
        case 10: {//用户信息
            
            [[GBSDK shareInstance] showUserInfo];
            
            break;
        }
            
        case 11: {//分享
            ShareViewController *viewController = [[ShareViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 12: {
            //加载自顶一个的WebView
            //这个自定义的网页 会 添加默认的参数，和账号cookie信息
            [[GBSDK shareInstance] showWebView:@"http://edit.gamebegin.com"];
            
            break;
        }
        case 13: {
            //隐藏悬浮按钮
            [[GBSDK shareInstance] hideFloatingButton];
            
            break;
        }
        default:
            break;
    }
}

- (void)floatingButton {
    CGPoint point = CGPointMake(0, 50);
    [[GBSDK shareInstance] floatingButton:point];
}


- (void)loginAction {
    [[GBSDK shareInstance] login:^(GBCallbackModel *callbackModel) {
        
        //登录回调
        NSLog(@"callbackModel = %ld", (long)callbackModel.status);
        NSLog(@"callbackModel = %@", callbackModel.message);
        NSLog(@"callbackModel = %@", callbackModel.data);
        
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
        NSString *message = [NSString stringWithFormat:@"status = %ld \n message = %@ \n(long) data = %@",(long)callbackModel.status, callbackModel.message, callbackModel.data];
        [self showAlert:@"登陆" message:message];
    }];
}

- (void)showAlert:(NSString *)title message:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 状态栏隐藏
-(BOOL)prefersStatusBarHidden {
    return YES;
}
@end
