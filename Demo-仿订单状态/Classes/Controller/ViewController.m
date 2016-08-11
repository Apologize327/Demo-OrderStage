//
//  ViewController.m
//  Demo-CALayerTest
//
//  Created by Suning on 16/3/29.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "TimeLineTableVIewCell.h"
#import "TimeLineModel.h"

#define mScreenWidth    [UIScreen mainScreen].bounds.size.width
#define mScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *_tableView;
    NSMutableArray *_stageArr;
    UIView *_topLineView;
    UIView *_bottomLineView;
    CGFloat _leadingSpaceOfLines;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单物流";
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _stageArr = [NSMutableArray array];
    [self setUpStageArr];
    
    _topLineView = [UIView new];
    _bottomLineView = [UIView new];
    _bottomLineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_topLineView];
    [self.view addSubview:_bottomLineView];
}

//初始化数据
-(void)setUpStageArr{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StageResource" ofType:@"plist"];
    NSArray *arrTemp = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in arrTemp) {
        TimeLineModel *model = [[TimeLineModel alloc]init];
        [model initWithDict:dict];
        [_stageArr addObject:model];
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _stageArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"cell";
    TimeLineTableVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (nil == cell) {
        cell = [[TimeLineTableVIewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellIdentify];
    }
    
    cell.bottomLine.backgroundColor = (indexPath.row == _stageArr.count-1)?[UIColor lightGrayColor]:cell.topLine.backgroundColor;
    _bottomLineView.backgroundColor = cell.bottomLine.backgroundColor;
    _topLineView.backgroundColor = cell.topLine.backgroundColor;
   
    //获取cell中topLine的x坐标
    /**
     *  获取A视图中的view在B视图中的点的位置
     *  - (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view
     */
    _leadingSpaceOfLines = [cell convertPoint:cell.topLine.frame.origin toView:self.view].x;
    [self scrollViewDidScroll:tableView];
    
    TimeLineModel *model = [_stageArr objectAtIndex:indexPath.row];
    [cell refreshCell:model];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _topLineView.frame = CGRectMake(_leadingSpaceOfLines, 0, 4, -scrollView.contentOffset.y);
    CGFloat yOffSet = scrollView.height + scrollView.contentOffset.y - scrollView.contentSize.height;
    _bottomLineView.frame = CGRectMake(_leadingSpaceOfLines, self.view.height - yOffSet, 4, self.view.height);
}

@end
