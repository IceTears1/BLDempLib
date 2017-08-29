//
//  ViewController.m
//  aaa
//
//  Created by 冰泪 on 2017/5/8.
//  Copyright © 2017年 冰泪. All rights reserved.
//

#import "ViewController.h"
#import "BLDIYHeader.h"
#define DeviceMaxHeight ([UIScreen mainScreen].bounds.size.height)
#define DeviceMaxWidth ([UIScreen mainScreen].bounds.size.width)
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableViewLeft;
@end

@implementation ViewController
- (void)example02
{
    self.tableViewLeft.mj_header = [BLDIYHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableViewLeft.mj_header beginRefreshing];
}

#pragma mark 下拉刷新数据
- (void)loadNewData 
{
     __weak __typeof(&*self)weakSelf =self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableViewLeft.mj_header endRefreshing];
    });
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self example02];
}
#pragma mark tableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 50;

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"BgCell";
    UITableViewCell *bgCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (bgCell == nil) {
        bgCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
        bgCell.backgroundColor = [UIColor colorWithRed:(arc4random() % 255)/255.0 green:(arc4random() % 255)/255.0  blue:(arc4random() % 255)/255.0  alpha:1];
    bgCell.selectionStyle = UITableViewCellSelectionStyleNone;
    bgCell.textLabel.textAlignment = NSTextAlignmentCenter;
    //标题cell
    return bgCell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
            return 50;
}

-(UITableView *)tableViewLeft{
    if (!_tableViewLeft) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        _tableViewLeft = [[UITableView alloc]initWithFrame:CGRectMake(0,64,DeviceMaxWidth ,DeviceMaxHeight) style:UITableViewStylePlain];
        _tableViewLeft.delegate = self;
        _tableViewLeft.dataSource = self;
        _tableViewLeft.tag = 0;
        [self.view addSubview:_tableViewLeft];
        
    }
    return _tableViewLeft;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
