//
//  UIImage+Round.m
//  Demo-生命周期
//
//  Created by Suning on 16/8/9.
//  Copyright © 2016年 jf. All rights reserved.
//

#import "UIImage+Round.h"

@implementation UIImage (Round)

-(UIImage *)cutRoundImage{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    // 设置圆形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    // 裁剪
    CGContextClip(ctr);
    // 将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
