//
//  UIImage+Round.h
//  Demo-生命周期
//
//  Created by Suning on 16/8/9.
//  Copyright © 2016年 jf. All rights reserved.
//
//  对图片设置圆角

#import <UIKit/UIKit.h>

@interface UIImage (Round)

/**
 *  使用绘图对图片进行设置圆角
 *
 *  @return 设置好的图片
 */
-(UIImage *)cutRoundImage;

@end
