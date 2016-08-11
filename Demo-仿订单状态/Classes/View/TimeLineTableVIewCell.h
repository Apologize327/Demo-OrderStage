//
//  TimeLineTableVIewCell.h
//  Demo-仿订单状态
//
//  Created by Suning on 16/8/9.
//  Copyright © 2016年 jf. All rights reserved.
//
//  时间线cell

#import <UIKit/UIKit.h>
#import "TimeLineModel.h"

@interface TimeLineTableVIewCell : UITableViewCell

/** 阶段头像 */
@property(nonatomic,copy) NSString *stageHeadName;
/** 阶段描述 */
@property(nonatomic,copy) NSString *stageContent;
/** 阶段时间 */
@property(nonatomic,copy) NSString *stageTime;
/** 阶段详情 */
@property(nonatomic,copy) NSString *stageDes;

@property(nonatomic,strong) UIView *topLine;
@property(nonatomic,strong) UIView *bottomLine;

-(void)refreshCell:(TimeLineModel *)timeLineModel;

@end
