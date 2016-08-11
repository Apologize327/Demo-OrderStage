//
//  TimeLineModel.m
//  Demo-仿订单状态
//
//  Created by Suning on 16/8/10.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "TimeLineModel.h"

@implementation TimeLineModel

-(void)initWithDict:(NSDictionary *)dict{
    if (nil == dict) {
        return;
    }
    self.stageHeadName = dict[@"stageName"];
    self.stageContent = dict[@"stageContent"];
    self.stageTime = dict[@"stageTime"];
    self.stageDes = dict[@"stageDes"];
}

@end
