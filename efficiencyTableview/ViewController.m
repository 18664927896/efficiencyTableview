//
//  ViewController.m
//  efficiencyTableview
//
//  Created by admin on 2018/7/31.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "MJRefresh.h"
#import "SGShopBaseCell.h"
#import "SGShopOneCell.h"
#import "SGShopTwoCell.h"
#import "SGShopThreeCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self addView];
    [self addConstrain];
    [self initUpRefreshWithMessageCenter];
    [self initData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 初始化上拉下拉事件
 */
- (void)initUpRefreshWithMessageCenter
{
    __weak __typeof (self) weakSelf = self;
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArr removeAllObjects];
        [self.tableView reloadData];
        [weakSelf initData];
    }];

    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf initData];

    }];
}

#pragma mark - 添加视图
- (void)addView{
    [self.view addSubview:self.tableView];
    [_tableView registerClass:[SGShopBaseCell class] forCellReuseIdentifier:@"SGShopBaseCell"];
    [_tableView registerClass:[SGShopOneCell class] forCellReuseIdentifier:@"SGShopOneCell"];
    [_tableView registerClass:[SGShopTwoCell class] forCellReuseIdentifier:@"SGShopTwoCell"];
    [_tableView registerClass:[SGShopThreeCell class] forCellReuseIdentifier:@"SGShopThreeCell"];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor redColor];
    }

    return _tableView;
}

#pragma mark - 添加约束
-(void)addConstrain{

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view.mas_right);
        make.left.mas_equalTo(self.view.mas_left);
        make.top.mas_equalTo(self.view.mas_top);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];

}

#pragma mark - UITableViewDataSource

//返回分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

//每个分区返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     ShopModel *model = self.dataArr[indexPath.row];
    SGShopBaseCell *cell;
    switch (model.type) {
        case 1:{
            static NSString *oneIdentifier = @"SGShopOneCell";
            cell = [tableView dequeueReusableCellWithIdentifier:oneIdentifier];
        }
            break;
        case 2:{
            static NSString *twoIdentifier = @"SGShopTwoCell";
            cell = [tableView dequeueReusableCellWithIdentifier:twoIdentifier];
        }
            break;
        case 3:{
            static NSString *threeIdentifier = @"SGShopThreeCell";
            cell = [tableView dequeueReusableCellWithIdentifier:threeIdentifier];
        }
            break;

        default:{
            static NSString *baseIdentifier = @"SGShopBaseCell";
            cell = [tableView dequeueReusableCellWithIdentifier:baseIdentifier];
        }
            break;
    }
    [cell refreshCell:self.dataArr[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;{

    ShopModel *model = self.dataArr[indexPath.row];
    return model.rowHeight;

//    if (model.type==0) {
//        return 30+10+20.5;
//    }else{
//        return 30.3+10.9+20+30.9;
//    }
}

////预估高度
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 10;
//}
//选择行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark - 初始化数据
- (void)initData{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{//3秒钟后改变执行条件
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        for (NSInteger i=0; i<10000; i++) {
            ShopModel *model = [[ShopModel alloc] init];
            model.type = i%4;
            model.name = @"测试";
            model.des = @"随便描述一下";
            model.price = @"55";
            //不要频繁的在cell里面创建对象
            model.price = [NSString stringWithFormat:@"%@¥",model.price];
            model.imagePath = @"http://img3.redocn.com/tupian/20150106/aixinxiangkuang_3797284.jpg";
            [self.dataArr addObject:model];

            //高度缓存到model
            if (model.type==0) {
                model.rowHeight = 60;
            }else{
                //模拟高度计算
                model.rowHeight = 60+30;
            }
        }
        [self.tableView reloadData];
    });



}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];

    }
    return  _dataArr;

}

@end
;
