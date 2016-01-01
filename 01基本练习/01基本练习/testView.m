//
//  testView.m
//  01基本练习
//
//  Created by 章芝源 on 16/1/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "testView.h"

@implementation testView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"%s", __FUNCTION__);
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"%s", __FUNCTION__);
    }
    return self;
}

- (void)awakeFromNib
{
    NSLog(@"%s", __FUNCTION__);
}


- (void)drawRect:(CGRect)rect
{
    NSLog(@"%s", __func__);
    NSLog(@"%@", NSStringFromCGRect(rect));
    //画线1
//    [self drawLine];
    //贝塞尔
//    [self drawLine2];
    [self drawLine7];
}
- (void)drawLine7
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(30, 30)];
    [bzrPath addLineToPoint:CGPointMake(300, 300)];
    CGContextAddPath(ctx, bzrPath.CGPath);

    //面向对象思想, 当上一个bzrPath画好已经添加到了图形上下文, 这个路径就没什么用了,  我们可以给这个路径重新画线,然后再次添加到图形上下文
    UIBezierPath *bzrPath1 = [UIBezierPath bezierPath];//貌似一个图形上下文中. 路径只能存在一条?
    [bzrPath moveToPoint:CGPointMake(100, 100)];
    [bzrPath addLineToPoint:CGPointMake(400, 100)];
    CGContextAddPath(ctx, bzrPath1.CGPath);
    CGContextStrokePath(ctx);
}

//不相连的线使用不同路径
- (void)drawLine6
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(30, 30)];
    [bzrPath addLineToPoint:CGPointMake(300, 300)];
    CGContextAddPath(ctx, bzrPath.CGPath);
    
    //面向对象思想, 当上一个bzrPath画好已经添加到了图形上下文, 这个路径就没什么用了,  我们可以给这个路径重新画线,然后再次添加到图形上下文
    bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(50, 100)];
    [bzrPath addLineToPoint:CGPointMake(400, 100)];
    CGContextAddPath(ctx, bzrPath.CGPath);
    CGContextStrokePath(ctx);
}

//不相连的线, 使用同一个路径
- (void)drawLine5
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(30, 30)];
    [bzrPath addLineToPoint:CGPointMake(300, 300)];

    [bzrPath moveToPoint:CGPointMake(50, 100)];
    [bzrPath addLineToPoint:CGPointMake(400, 100)];
    CGContextAddPath(ctx, bzrPath.CGPath);
    CGContextStrokePath(ctx);
}

//画两条线  连线
- (void)drawLine4
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(30, 30)];
    [bzrPath addLineToPoint:CGPointMake(300, 300)];
    [bzrPath addLineToPoint:CGPointMake(200, 400)];
    CGContextAddPath(ctx, bzrPath.CGPath);
    [bzrPath stroke];
}
//最简洁写法
- (void)drawLine3
{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *bzrPath = [UIBezierPath bezierPath];
    [bzrPath moveToPoint:CGPointMake(50, 50)];
    [bzrPath addLineToPoint:CGPointMake(300, 100)];
    [bzrPath stroke];
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
