//
//  CustomView.m
//  BSEquxian
//
//  Created by 范琦 on 16/1/8.
//  Copyright (c) 2016年 范琦. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    //写文字
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
//    [@"画圆：" drawInRect:CGRectMake(10, 20, 80, 20) withFont:font];
    
    // 段落样式
    NSMutableParagraphStyle *paragraphStyle= [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *dic = @{
                          //设置字体
                          NSFontAttributeName : [UIFont systemFontOfSize:15],
                          //文字颜色
                          NSForegroundColorAttributeName : [UIColor redColor],
                          //段落样式
                          NSParagraphStyleAttributeName : paragraphStyle,
                          //背景颜色
                          NSBackgroundColorAttributeName : [UIColor blackColor],
                          // 设置描边颜色(类似艺术字, 使文字空心)
                          NSStrokeColorAttributeName : [UIColor redColor],
                          // 设置描边宽度(正负相反)
                          NSStrokeWidthAttributeName : @"3"
                          };
    // iOS7.0新方法
    [@"画圆: " drawInRect:CGRectMake(10, 20, 80, 25) withAttributes:dic];
    [@"画线及弧线: " drawInRect:CGRectMake(10, 80, 80, 25) withAttributes:dic];
    [@"画矩形: " drawInRect:CGRectMake(10, 120, 80, 25) withAttributes:dic];
    [@"画扇形和椭圆: " drawInRect:CGRectMake(10, 160, 100, 25) withAttributes:dic];
    [@"画三角形: " drawInRect:CGRectMake(10, 220, 100, 25) withAttributes:dic];
    [@"画圆角矩形: " drawInRect:CGRectMake(10, 260, 100, 25) withAttributes:dic];
    [@"画贝塞尔曲线: " drawInRect:CGRectMake(10, 300, 100, 25) withAttributes:dic];
    [@"图片: " drawInRect:CGRectMake(10, 340, 100, 25) withAttributes:dic];

    /* 画圆 */

    //边框圆
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 100, 20, 15, 0, 2 * M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    //填充圆，无边框
    CGContextAddArc(context, 150, 30, 30, 0, 2*M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    //画大圆并填充颜
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 250, 40, 40, M_PI / 6 , 1.5 * M_PI, 0); //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充

    
    /*画线及孤线*/
    //画线
    CGPoint aPoints[3];//坐标点
    aPoints[0] =CGPointMake(100, 80);//坐标1
    aPoints[1] =CGPointMake(130, 80);//坐标2
    aPoints[2] =CGPointMake(140, 100);//坐标3
//    CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 3);//添加线(有几个点第三个参数写几)
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    //画笑脸弧线
    //左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
    CGContextMoveToPoint(context, 140, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
    CGContextStrokePath(context);//绘画路径
    
    
    //右
    CGContextMoveToPoint(context, 160, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
    CGContextStrokePath(context);//绘画路径
    
    
    
    //右
    CGContextMoveToPoint(context, 150, 90);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
    CGContextStrokePath(context);//绘画路径
    //注，如果还是没弄明白怎么回事，请参考：http://donbe.blog.163.com/blog/static/138048021201052093633776/
    
    
    /*画矩形*/
    CGContextStrokeRect(context,CGRectMake(100, 120, 10, 10));//画方框
    CGContextFillRect(context,CGRectMake(120, 120, 10, 10));//填充框
    //矩形，并填弃颜色
    CGContextSetLineWidth(context, 2.0);//线的宽度
    aColor = [UIColor blueColor];//blue蓝色
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
    CGContextAddRect(context,CGRectMake(140, 120, 60, 30));//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
