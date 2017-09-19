//
//  ChartView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChartView.h"

@implementation ChartView {
    NSBezierPath *firstLinePath;
    NSBezierPath *secondLinePath;
    NSMutableArray *firstLinePoints;
}

@synthesize barWidth, barMargin;
@synthesize firstLineWidth, secondLineWidth;
@synthesize currentPercent;
@synthesize firstLinePointsDistance, secondLinePointsDistance;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if(self) {
        [self updateBackBar];
        [self updateFirstLine];
    }
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self preDrawBackBarChart];
        [self preDrawFirstLine];
    }
    return self;
}

-(void)updateBackBar {
    NSInteger startPosition = self.mainBoxView.subviews.count - 1;
    CGFloat displayHeight = self.mainBox.frame.size.height * currentPercent/100;
    for(NSInteger i = startPosition; i >= 0 ; i--) {
        NSView *currentView = [self.mainBoxView.subviews objectAtIndex:i];
        CGFloat currentHeight = currentView.frame.size.height;
        currentView.frame = CGRectMake(currentView.frame.origin.x, currentView.frame.origin.y, currentView.frame.size.width, displayHeight);
        displayHeight = currentHeight;
    }
}

-(void)updateFirstLine {
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:[firstLinePoints count]];
    [firstLinePath removeAllPoints];
    if(firstLinePoints && firstLinePoints.count > 0) {
        NSInteger startPoint = firstLinePoints.count - 1;
        NSPoint displayPoint = CGPointMake([self createPointFromDictionary:[firstLinePoints objectAtIndex:startPoint-1]].x, self.mainBox.frame.size.height*currentPercent/100);
        for(NSInteger i = startPoint; i >=0; i--) {
            if(i == startPoint) {
                [newArray addObject:[self createPointDictionary:CGPointMake(NSMidX(self.dotImage.frame), NSMidY(self.dotImage.frame))]];
                [firstLinePath moveToPoint:CGPointMake(NSMidX(self.dotImage.frame), NSMidY(self.dotImage.frame))];
            } else {
                NSPoint currentPoint = [self createPointFromDictionary:[firstLinePoints objectAtIndex:i]];
                [newArray addObject:[self createPointDictionary:displayPoint]];
                [firstLinePath lineToPoint:currentPoint];
                displayPoint = currentPoint;
            }
        }
        firstLinePath = [self quadCurvedPathWithPoints:newArray];
        [[NSColor redColor] set];
        [firstLinePath stroke];
    }
    [firstLinePath closePath];
}

-(void)preDrawBackBarChart {
    [self.mainBoxView setSubviews:@[]];
    if(self.barWidth == 0)
        self.barWidth = 3;
    if(self.barMargin == 0)
        self.barMargin = 3;
    CGFloat summ = self.barMargin + self.barWidth;
    int count = self.bounds.size.width / summ;
    for(int i = 0; i < count; i ++) {
        NSBox *barBox = [[NSBox alloc] initWithFrame:CGRectMake(summ*i, 0, barWidth, 0)];
        [barBox setBoxType:NSBoxCustom];
        [barBox setFillColor:[NSColor yellowColor]];
        [self.mainBox addSubview:barBox];
    }
}

-(void)preDrawFirstLine {
    if(firstLineWidth == 0)
        firstLineWidth = 4;
    if(firstLinePointsDistance == 0)
        firstLinePointsDistance = 2.0f;
    if(!firstLinePath) {
        firstLinePath = [[NSBezierPath alloc] init];
        [firstLinePath setLineWidth:firstLineWidth];
        
        NSPoint startPoint = CGPointMake(NSMidX(self.dotImage.frame), NSMidY(self.dotImage.frame));
        
        int pointsCount = self.bounds.size.width / firstLinePointsDistance;
        if(pointsCount > 0)
            firstLinePoints = [[NSMutableArray alloc] initWithCapacity:pointsCount];
        [firstLinePoints addObject:[self createPointDictionary:startPoint]];
        for(int i = 0; i < pointsCount - 1; i++) {
            NSPoint p = CGPointMake(i*firstLinePointsDistance, NSMidY(self.dotImage.frame));
            [firstLinePoints addObject:[self createPointDictionary:p]];
        }
        
        firstLinePath = [self quadCurvedPathWithPoints:firstLinePoints];
        
        [[NSColor redColor] set];
        [firstLinePath stroke];
        [firstLinePath closePath];
    }
}

-(NSDictionary *) createPointDictionary : (NSPoint) point {
    return @{@"x":[NSNumber numberWithFloat:point.x], @"y":[NSNumber numberWithFloat:point.y]};
}

-(NSPoint) createPointFromDictionary : (NSDictionary *) dict {
    CGFloat x = [(NSNumber *)[dict objectForKey:@"x"] floatValue];
    CGFloat y = [(NSNumber *)[dict objectForKey:@"y"] floatValue];
    return CGPointMake(x, y);
}

- (NSBezierPath *)quadCurvedPathWithPoints:(NSArray *)points
{
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    NSPoint value = [self createPointFromDictionary:points[0]];
    NSPoint p1 = value;
    [path moveToPoint:p1];
    
    if (points.count == 2) {
        value = [self createPointFromDictionary:points[1]];
        CGPoint p2 = value;
        [path lineToPoint:p2];
        return path;
    }
    
    for (NSUInteger i = 1; i < points.count; i++) {
        value = [self createPointFromDictionary:points[i]];
        CGPoint p2 = value;
        
        CGPoint midPoint = midPointForPoints(p1, p2);
        [path relativeCurveToPoint:p1 controlPoint1:midPoint controlPoint2:p1];
        [path relativeCurveToPoint:p2 controlPoint1:midPoint controlPoint2:p2];
        
        p1 = p2;
    }
    return path;
}

static CGPoint midPointForPoints(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) / 2, (p1.y + p2.y) / 2);
}

static CGPoint controlPointForPoints(CGPoint p1, CGPoint p2) {
    CGPoint controlPoint = midPointForPoints(p1, p2);
    CGFloat diffY = abs(p2.y - controlPoint.y);
    
    if (p1.y < p2.y)
        controlPoint.y += diffY;
    else if (p1.y > p2.y)
        controlPoint.y -= diffY;
    
    return controlPoint;
}

@end
