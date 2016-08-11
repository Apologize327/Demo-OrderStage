//
//  TimeLineModel.h
//  Demo-仿订单状态
//
//  Created by Suning on 16/8/10.
//  Copyright © 2016年 jf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeLineModel : NSObject

/** 阶段头像 */
@property(nonatomic,copy) NSString *stageHeadName;
/** 阶段描述 */
@property(nonatomic,copy) NSString *stageContent;
/** 阶段时间 */
@property(nonatomic,copy) NSString *stageTime;
/** 阶段详情 */
@property(nonatomic,copy) NSString *stageDes;

-(void)initWithDict:(NSDictionary *)dict;

@end
