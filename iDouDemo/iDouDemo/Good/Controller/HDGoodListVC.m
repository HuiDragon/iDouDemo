//
//  HDGoodListVC.m
//  iDouDemo
//
//  Created by Liuguiliang on 2017/8/21.
//  Copyright © 2017年 HuiDragon. All rights reserved.
//

#import "HDGoodListVC.h"
#import "HDGoodVM.h"
#import <Masonry/Masonry.h>
#import "HDGoodCell.h"
#import "HDGoodDetailVC.h"
#import <MJRefresh/MJRefresh.h>

@interface HDGoodListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) HDGoodVM *goodVM;
@property (strong, nonatomic) UITableView *goodList;

@end

@implementation HDGoodListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.goodList];
    [self.goodVM loadData];
    [self setupLayout];
    [self subscribe];
}

- (void)setupLayout {
    
    [self.goodList mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
}

- (void)subscribe {
    @weakify(self);
    [self.goodVM.successSubject subscribeNext:^(NSArray *dataSource) {
        @strongify(self);
        
        self.goodVM.dataSource = dataSource;
        [self.goodList reloadData];
    }];
    
    [self.goodVM.failSubject subscribeNext:^(id  _Nullable x) {
        
    }];
    
}



#pragma mark- UITableViewDelegate or UITableViewDataSource
//单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.goodVM.dataSource.count;
}
//cell创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HDGoodCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HDGoodCell class]) forIndexPath:indexPath];
    cell.goodItem = self.goodVM.dataSource[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    HDGoodDetailVC *detailVC = [[HDGoodDetailVC alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (HDGoodVM *)goodVM {
    if (!_goodVM) {
        _goodVM= [[HDGoodVM alloc] init];
    }
    
    return _goodVM;
}

- (UITableView *)goodList {
    
    if (!_goodList) {
        _goodList = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _goodList.tableFooterView = [UIView new];
        _goodList.estimatedRowHeight = 100;
        _goodList.rowHeight = UITableViewAutomaticDimension;
        _goodList.showsVerticalScrollIndicator = NO;
        _goodList.delegate = self;
        _goodList.dataSource = self;
        
        [_goodList registerClass:[HDGoodCell class] forCellReuseIdentifier:NSStringFromClass([HDGoodCell class])];
    }
    return _goodList;
}

@end
