//
//  TableViewRAMOptimizeViewController.m
//  Tableview_RAM_Optimize
//
//  Created by yi on 16/3/16.
//  Copyright © 2016年 yi. All rights reserved.
//

#import "TableViewRAMOptimizeViewController.h"

/**
 *  Tableview 性能优化 
 */


@interface TableViewRAMOptimizeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}
@end

@implementation TableViewRAMOptimizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = [[NSMutableArray alloc] init];
    [self createTableView];
}
- (void)createTableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 44.0;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor colorWithRed:231/255.0 green:236/255.0 blue:243/255.0 alpha:1];
        [self.view addSubview:_tableView];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    if (_tableView.dragging == NO && _tableView.decelerating == NO) {
        NSLog(@"----tableview初始化显示----%ld",indexPath.row);
    }
    
    return cell;
}

//结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (_tableView.dragging == NO && _tableView.decelerating == NO) {
        NSArray *visiblePaths = [_tableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            //获取的dataSource里面的对象，并且判断加载完成的不需要再次异步加载
            NSLog(@" 结束拖拽   第%ld行可视   ",indexPath.row);
        }
    }
}

//结束减速
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (_tableView.dragging == NO && _tableView.decelerating == NO) {
        NSArray *visiblePaths = [_tableView indexPathsForVisibleRows];
        for (NSIndexPath *indexPath in visiblePaths)
        {
            //获取的dataSource里面的对象，并且判断加载完成的不需要再次异步加载
            NSLog(@" 减速   第%ld行可视   ",indexPath.row);
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

