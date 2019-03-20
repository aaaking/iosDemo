//
//  ShareViewController.m
//  GameBeginSDK
//
//  Created by bruce on 2017/11/17.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import "ShareViewController.h"
#import <GBSDK/GBSDK.h>
#import <GBSDKShareKit/GBSDKShareKit.h>

@interface ShareViewController ()
@property(nonatomic, strong) NSArray *list;

@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rectOfNavigationbar = self.navigationController.navigationBar.frame;
    CGFloat navHeight = rectOfNavigationbar.size.height;
    if([GBSDK shareInstance].getScreenOrientation == UIInterfaceOrientationPortrait) {
        navHeight += 20;
    }
    
    _list = [[NSArray alloc] initWithObjects:@"FB链接分享",@"FB图片分享", nil];
    
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnAction:(UIButton *)btn {
    
    NSLog(@"%ld",(long)btn.tag);
    switch (btn.tag) {
            
        case 0: {//FB链接分享
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/app/id1272487963"];
            [[GBSDKShareKit shareInstance] facebookLink:url block:^(GBShareType type, BOOL isSuccess) {
                NSLog(@"分享结果 = %d", isSuccess);
            }];
            
            
            break;
        }
        case 1: {//FB图片分享
            UIImage *image = [UIImage imageNamed:@"image.png"];
            [[GBSDKShareKit shareInstance] facebookWithImage:image block:^(GBShareType type, BOOL isSuccess) {
                NSLog(@"分享结果 = %d", isSuccess);
            }];
            break;
        }
    }
}

@end
