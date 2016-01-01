//
//  testView.m
//  01基本练习
//
//  Created by 章芝源 on 16/1/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "testView.h"

@implementation testView
//
- (void)drawRect:(CGRect)rect
{
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(rect));
    //画线1
//    [self drawLine];
    //贝塞尔
    [self drawLine2];
}

- (void)drawLine2
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(100, 100)];
    [bzrPath addLineToPoint:CGPointMake(300, 300)];
    CGContextAddPath(ctx, bzrPath.CGPath);
    
    //在渲染之前, 可以进行上下文内容的设置绘图状态
    CGContextSetLineWidth(ctx, 10);
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    CGContextStrokePath(ctx);
}

- (void)drawLine
{
    //1.获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //2.获得路径
    CGMutablePathRef path = CGPathCreateMutable();
    //3.开始画图
    CGPathMoveToPoint(path, NULL, 100, 100);
    CGPathAddLineToPoint(path, NULL, 300, 300);
    //4.画好的添加到图形上下文中
    CGContextAddPath(ctx, path);
    //5.把图形上下文内容渲染到控件上
    CGContextStrokePath(ctx);
}
@end
