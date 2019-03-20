//
//  TrackTableTableViewController.m
//  GameBeginSDK
//
//  Created by bruce on 2017/11/8.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import "TrackTableTableViewController.h"
#import <GBSDK/GBSDK.h>
@interface TrackTableTableViewController () {
    NSArray *_array;
    UITableView *_tableview;
    
    NSInteger _index;
}

@end

@implementation TrackTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _array = [[NSArray alloc]
              initWithObjects:
              @"0 选服接口",
              @"1 游戏开始加载,",
              @"2 游戏结束加载,",
              @"3 资源开始下载",
              @"4 资源结束下载",
              @"5 新手引导开始",
              @"6 新手引导结束",
              @"7 更新开始",
              @"8 更新结束",
              @"9 等级统计",
              @"10 场景统计",
              @"11 自定义事件统计1",
              @"12 自定义事件统计2",
              @"13 自定义事件统计3",
              nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellN = @"CellN1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellN];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier: cellN];
    }
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"index is %ld",(long)indexPath.row);
    
    switch (indexPath.row) {
        case 0 :{
            //选服统计
            //选择区服，知道用户的角色信息的时候再调用，这边作为测试，写到这边。
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:5];
            [dic setObject:@"Name-孙悟空" forKey:GB_ROLE_NAME];//角色名 可以为空
            [dic setObject:@"level-99" forKey:GB_ROLE_LEVEL];//角色等级 可以为空
            [dic setObject:@"100" forKey:GB_ROLE_COIN];//游戏币（如银两）余额 可以为空
            [dic setObject:@"9999" forKey:GB_ROLE_MENEY];//货币（如元宝）余额 可以为空
            
            [[GBSDK shareInstance] serverID:@"第100服" andRoleID:@"id123456" andInfo:dic];
            
            break;
        }
        case 1 :{
            [[GBSDK shareInstance] startLoading];
            break;
        }
        case 2 :{
            //游戏结束加载
            [[GBSDK shareInstance] endLoading];
            break;
        }
        case 3 :{
            //游戏资源下载结束
            [[GBSDK shareInstance] startDownResource];
            break;
        }
        case 4 :{
            
            [[GBSDK shareInstance] endDownResource];
            break;
        }
        case 5 :{
            [[GBSDK shareInstance] starGuide];

            break;
        }
        case 6:{
            [[GBSDK shareInstance] endGuide];

            
            break;
        }
        case 7 :{
            [[GBSDK shareInstance] startUpdate];

            break;
        }
        case 8:{
            [[GBSDK shareInstance] endUpdate];
            break;
        }
        case 9:{
            NSString *levelName = @"等级10";
            [[GBSDK shareInstance] level:levelName];
            
            break;
        }
        case 10:{
            NSString *sceneName = @"等级10";
            [[GBSDK shareInstance] scene:sceneName];
            
            break;
        }
        case 11:{
            
            [[GBSDK shareInstance] trackEvent:@"事件名称"];
            break;
        }
        case 12:{
            
            [[GBSDK shareInstance] trackEvent:@"事件名称" withValue:@"事件vale"];

            break;
        }
        case 13:{
            
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [dic setObject:@"事件vale1" forKey:@"事件名称1"];
            [dic setObject:@"事件vale2" forKey:@"事件名称2"];
            
            [[GBSDK shareInstance] trackEvent:@"事件名称" withValues:dic];

            break;
        }
        default:{
            
        }
    }
    
}

@end
