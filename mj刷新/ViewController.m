//
//  ViewController.m
//  mj刷新
//
//  Created by 古振坤 on 2017/11/27.
//  Copyright © 2017年 Snail-zk. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>
#import <MBProgressHUD.h>
#import <HHPullToRefreshWave.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)UITableView *Tableview;
@property(nonatomic,strong)NSArray *dataArr;

@end

@implementation ViewController
-(void)dealloc{
    [self.Tableview hh_removeRefreshView];
}
-(UITableView *)Tableview
{
    if (!_Tableview) {
        self.Tableview = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        self.Tableview.dataSource = self;
        self.Tableview.delegate = self;
//         __unsafe_unretained __typeof(self) weakSelf = self;
//      self.Tableview.mj_header  =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//                [weakSelf.Tableview.mj_header endRefreshing];
//            });
//      }];
//        [self.Tableview.mj_header beginRefreshing];
//        self.Tableview.mj_header.automaticallyChangeAlpha = YES;
        
        [_Tableview hh_addRefreshViewWithActionHandler:^{
            NSLog(@"dda");
        }];
        [_Tableview hh_setRefreshViewTopWaveFillColor:[UIColor lightGrayColor]];
        [_Tableview hh_setRefreshViewBottomWaveFillColor:[UIColor whiteColor]];
    }
    return _Tableview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"";
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:57/255.0 green:67/255.0 blue:89/255.0 alpha:1];
    self.Tableview.backgroundColor =[UIColor colorWithRed:57/255.0 green:67/255.0 blue:89/255.0 alpha:1];
    [self Tableview];

    
    [self.view addSubview:_Tableview];
    [self.Tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.dataArr = [NSArray new];
    self.dataArr  = @[@"da",@"dae",@"dawew",@"daweee",@"d2a",@"d1ae",@"da4wew",@"daw6eee"];
    // Do any additional setup after loading the view, typically from a nib.
    
}


#pragma  mark
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text  = self.dataArr[indexPath.section];
    return  cell;
}
#pragma  mjRefeesh

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
