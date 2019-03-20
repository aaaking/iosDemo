//
//  IAPTableViewController.m
//  GameBeginSDK
//
//  Created by bruce on 2017/9/18.
//  Copyright © 2017年 GameBegin. All rights reserved.
//

#import <GBSDK/GBSDK.h>
#import "IAPTableViewController.h"

@interface IAPTableViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate> {
    NSArray *_array;
    UITableView *_tableview;
    
    NSInteger _index;
}

@property(nonatomic, strong) NSMutableArray *buyBtnArray;
@end

@implementation IAPTableViewController

- (void)dealloc{
    NSLog(@"IAPTableViewController-dealloc");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = [[GBSDK shareInstance] productsArray];
    for(SKProduct *product in array) {
        

        NSLog(@"productIdentifier = %@",product.productIdentifier);
        NSLog(@"price = %@",product.price);
        NSLog(@"product.priceLocale CurrencyCode = %@\n\n", [product.priceLocale objectForKey:NSLocaleCurrencyCode]);
    }
    
    self.buyBtnArray = [[NSMutableArray alloc] initWithCapacity:10];
    [self showTableView];
    
}

- (void)showTableView{

    //冒险王2 英文
//        _array = [[NSArray alloc]
//                  initWithObjects:
//                  @"mxw2_gold1_en",
//                  @"mxw2_gold2_en",
//                  @"mxw2_gold3_en",
//                  @"mxw2_gold4_en",
//                  @"mxw2_gold5_en",
//                  @"mxw2_gold6_en",nil];
    //热血街霸
    _array = [[NSArray alloc]
              initWithObjects:
              @"gamebegin_gold_60",
              @"zgws_gold_60",
              @"dtt_gold_60",
              @"dtt_gold_300",
              @"zgws_gold_300"
              @"rxjb_gold_60",
              @"rxjb_gold_300",
              @"rxjb_gold_600",
              @"rxjb_gold_900",
              @"rxjb_monthlycard",
              @"rxjb_yearcard",nil];
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    _tableview.delegate = self;
    _tableview.dataSource = self;
    [self.view addSubview:_tableview];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellN = @"CellN";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellN];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier: cellN];
    }
    
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    UIButton *buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [buyButton setShowsTouchWhenHighlighted:YES];
    
    buyButton.frame = CGRectMake(5, 0, 200, 40);
    buyButton.backgroundColor = [UIColor colorWithRed:0.318f green:0.729f blue:0.949f alpha:1.00f];
    [buyButton setTitle:@"Mai 买 Buy 購入" forState:UIControlStateNormal];
    buyButton.layer.cornerRadius = 5;
    buyButton.tag = indexPath.row;
    [buyButton addTarget:self action:@selector(buyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.accessoryView = buyButton;
    self.buyBtnArray[indexPath.row] = buyButton;
    
    return cell;
}
- (BOOL)shouldAutorotate{
    return YES;
}

#pragma  mark - 点击 购买
- (void)buyButtonTapped:(UIButton *)sender {
    
    NSLog(@"tag = %ld", (long)sender.tag);
    NSString *productID = [_array objectAtIndex:sender.tag];
    NSString *paramString = @"id10086透传参数,一般传自己的订单号";
//    [[GBSDK shareInstance] buyWithProductId:productID andQuantity:1 andCallbackInfo:@"callback message" andDelegate:self];
//    _index = sender.tag;
    
    [[GBSDK shareInstance] buyWithProductId:productID quantity:1 paramString:paramString showloading:YES callbackBlock:^(GBCallbackModel *callbackModel) {
       
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
        
//        //处理方式二，每个情况都去处理
//        switch (callbackModel.status) {
//            case message_issue_success: {
//                //物品下发成功
//                break;
//            }
//            case message_buying_error: {
//                //已有购买进行中，我们设置了一次只有能一个购买进行中
//                break;
//            }
//            case message_issue_error: {
//                //物品下发失败
//                break;
//            }
//            case message_get_order_error: {
//                //用户获取订单失败
//                break;
//            }
//            case message_product_info_error: {
//                //商品信息获取失败
//                break;
//            }
//            case message_user_paid_error: {
//                //用户支付失败，网络原因，或者 用户取消支付
//                break;
//            }
//            default:{
//
//            }
        
//        }
    }];
    
}


@end
