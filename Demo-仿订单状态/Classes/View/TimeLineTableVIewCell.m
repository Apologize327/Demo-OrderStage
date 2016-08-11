//
//  TimeLineTableVIewCell.m
//  Demo-仿订单状态
//
//  Created by Suning on 16/8/9.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "TimeLineTableVIewCell.h"
#import "UIView+Frame.h"

@interface TimeLineTableVIewCell(){
    UIImageView *_headView;
    UILabel *_contentLab;
    UILabel *_timeLab;
    UILabel *_desLab;
}

@end

@implementation TimeLineTableVIewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpBackGround];
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpBackGround];
    }
    return self;
}

-(void)setUpBackGround{
    //阶段头像
    CGFloat headViewY = 20;
    CGFloat headViewWH = 30;
    UIImageView *headView = [[UIImageView alloc]initWithFrame:CGRectMake(15, headViewY, headViewWH, headViewWH)];
    headView.image = [UIImage imageNamed:@"01"];
    [self.contentView addSubview:headView];
    _headView = headView;
    
    //下黄线
    UIView *bottomLineView = [[UIView alloc]initWithFrame:CGRectMake(20, headView.bottom+3, 4, headViewY+8)];
    bottomLineView.backgroundColor = [UIColor orangeColor];
    bottomLineView.centerX = headView.centerX;
    [self.contentView addSubview:bottomLineView];
    self.bottomLine = bottomLineView;
    
    //上黄线
    UIView *topLineView = [[UIView alloc]initWithFrame:CGRectMake(20, 0, 4, headViewY-3)];
    topLineView.backgroundColor = [UIColor orangeColor];
    topLineView.centerX = headView.centerX;
    [self.contentView addSubview:topLineView];
    self.topLine = topLineView;
    
    //背景
    UIImageView *backImgView = [[UIImageView alloc]initWithFrame:CGRectMake(headView.right+15, 10, 250, 50)];
    backImgView.image = [UIImage imageNamed:@"titleImage"];
    [self.contentView addSubview:backImgView];
    
    CGFloat backViewX = 25;
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(backViewX, 0, backImgView.width-backViewX, backImgView.height)];
    backView.backgroundColor = [UIColor clearColor];
    
    [backImgView addSubview:backView];
    
    
    //阶段描述
    CGFloat labH = 20;
    UILabel *contentLab = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 100, labH)];
    contentLab.font = [UIFont systemFontOfSize:14];
    [backView addSubview:contentLab];
    _contentLab = contentLab;
    
    //时间
    UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(contentLab.right+20, 5, 80, labH)];
    timeLab.font = [UIFont systemFontOfSize:11];
    timeLab.textColor = [UIColor grayColor];
    [backView addSubview:timeLab];
    _timeLab = timeLab;
    
    //详情
    UILabel *desLab = [[UILabel alloc]initWithFrame:CGRectMake(contentLab.left, contentLab.bottom+5, 120, labH)];
    desLab.font = [UIFont systemFontOfSize:12];
    desLab.textColor = [UIColor grayColor];
    [backView addSubview:desLab];
    _desLab = desLab;
    
}

-(void)refreshCell:(TimeLineModel *)timeLineModel{
    _headView.image = [UIImage imageNamed:timeLineModel.stageHeadName];
    _contentLab.text = timeLineModel.stageContent;
    _timeLab.text = timeLineModel.stageTime;
    _desLab.text = timeLineModel.stageDes;
    if ([_desLab.text isEqualToString:@""]) {
        _contentLab.frame = CGRectMake(5, 15, 100, 20);
        _timeLab.frame = CGRectMake(_contentLab.right+20, 15, 80,20);
    }
}

@end
