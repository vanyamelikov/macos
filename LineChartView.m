//
//  LineChartView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LineChartView.h"

@implementation LineChartView {
    NSMutableArray<NSNumber*> *firstLineValues;
    NSMutableArray<NSNumber*> *secondLineValues;
    NSBezierPath *firstPath;
    NSBezierPath *secondPath;
}

@synthesize firstLineWidth, secondLineWidth;
@synthesize firstLinePercent, secondLinePercent;
@synthesize firstLinePointsDistance, secondLinePointsDistance;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if(self) {
        [self updateFirstLine];
        [self updateSecondLine];
    }
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self preDrawFirstLine];
        [self preDrawSecondLine];
    }
    return self;
}

-(void)updateFirstLine {
    
    if(firstLineValues){
        CGFloat startX = NSMidX(self.dotImageView.frame);
        CGFloat startY = NSMidY(self.dotImageView.frame);
        NSPoint firstPoint = CGPointMake(startX, startY);
        [firstLineValues insertObject:[NSNumber numberWithFloat:self.bounds.size.height*(firstLinePercent/100)] atIndex:1];
        
        [firstPath removeAllPoints];
        [firstPath setLineWidth:firstLineWidth];
        
        [firstPath moveToPoint:firstPoint];
        
        for(NSInteger i = 0; i < firstLineValues.count - 2; i++) {
            NSPoint prev = CGPointMake(startX - i*firstLinePointsDistance, [(NSNumber *)[firstLineValues objectAtIndex:i+1] floatValue]);
            NSPoint p = CGPointMake(startX - i*firstLinePointsDistance, [(NSNumber *)[firstLineValues objectAtIndex:i] floatValue]);
            NSPoint midPoint = midPointForPoints(p, prev);
            [firstPath curveToPoint:p controlPoint1:controlPointForPoints(prev, midPoint) controlPoint2:controlPointForPoints(midPoint, p)];
            [firstPath moveToPoint:p];
        }
        
        [firstPath closePath];
        [[NSColor redColor] set];
        [firstPath stroke];
    }
    
}

-(void)updateSecondLine {
    
    if(secondLineValues){
        CGFloat startX = NSMidX(self.dotImageView.frame);
        CGFloat startY = NSMidY(self.dotImageView.frame);
        NSPoint firstPoint = CGPointMake(startX, startY);
        [secondLineValues insertObject:[NSNumber numberWithFloat:self.bounds.size.height*(secondLinePercent/100)] atIndex:1];
        
        [secondPath removeAllPoints];
        [secondPath setLineWidth:secondLineWidth];
        
        [secondPath moveToPoint:firstPoint];
        
        for(NSInteger i = 0; i < secondLineValues.count - 2; i ++) {
            NSPoint prev = CGPointMake(startX - i*secondLinePointsDistance, [(NSNumber *)[secondLineValues objectAtIndex:i+1] floatValue]);
            NSPoint p = CGPointMake(startX - i*secondLinePointsDistance, [(NSNumber *)[secondLineValues objectAtIndex:i] floatValue]);
            NSPoint midPoint = midPointForPoints(p, prev);
            [secondPath curveToPoint:p controlPoint1:controlPointForPoints(prev, midPoint) controlPoint2:controlPointForPoints(midPoint, p)];
            [secondPath moveToPoint:p];
        }
        [secondPath closePath];
        [[NSColor blueColor] set];
        [secondPath stroke];
    }
    
}

-(void)preDrawFirstLine {
    if(firstLineWidth == 0)
        firstLineWidth = 1;
    if(firstLinePointsDistance == 0)
        firstLinePointsDistance = 10.0f;
    if(!firstLineValues) {
        if(!firstPath) {
            firstPath = [[NSBezierPath alloc] init];
            NSInteger capacity = (self.bounds.size.width-35)/firstLinePointsDistance;
            firstLineValues = [[NSMutableArray alloc] initWithCapacity:capacity];
            for(NSInteger i = 0; i < capacity; i++)
                [firstLineValues addObject:[NSNumber numberWithFloat:self.bounds.size.height/2]];
        }
    }
}

-(void)preDrawSecondLine {
    if(secondLineWidth == 0)
        secondLineWidth = 1;
    if(secondLinePointsDistance == 0)
        secondLinePointsDistance = 10.0f;
    if(!secondLineValues) {
        if(!secondPath) {
            secondPath = [[NSBezierPath alloc] init];
            NSInteger capacity = (self.bounds.size.width-35)/secondLinePointsDistance;
            secondLineValues = [[NSMutableArray alloc] initWithCapacity:capacity];
            for(NSInteger i = 0; i < capacity; i++)
                [secondLineValues addObject:[NSNumber numberWithFloat:self.bounds.size.height/2]];
        }
    }
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
