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

-(void)updateLines {
    [self updateFirstLine];
    [self updateSecondLine];
}

-(void)updateFirstLine {
    
    if(firstLineValues){
        CGFloat startX = NSMidX(self.dotImageView.frame);
        CGFloat startY = self.bounds.size.height/2;
        NSPoint firstPoint = CGPointMake(startX, startY);
        [firstLineValues insertObject:[NSNumber numberWithFloat:self.bounds.size.height*(firstLinePercent/100)] atIndex:0];
        
        [firstPath removeAllPoints];
        [firstPath setLineWidth:firstLineWidth];
        
        [firstPath moveToPoint:firstPoint];
        
        for(NSInteger i = 0; i < firstLineValues.count; i++) {
            NSPoint p = CGPointMake(startX - i*firstLinePointsDistance, [((NSNumber *)[firstLineValues objectAtIndex:i]) floatValue] + 20.0f);
            [firstPath lineToPoint:p];
            [firstPath moveToPoint:p];
        }
        
        [firstPath closePath];
        [[NSColor colorFromHexString:@"#64EDE3"] set];
        [firstPath stroke];
    }
    
}

-(void)updateSecondLine {
    
    if(secondLineValues){
        CGFloat startX = NSMidX(self.dotImageView.frame);
        CGFloat startY = self.bounds.size.height/2;
        NSPoint firstPoint = CGPointMake(startX, startY);
        [secondLineValues insertObject:[NSNumber numberWithFloat:self.bounds.size.height*(secondLinePercent/100)] atIndex:0];
        
        [secondPath removeAllPoints];
        [secondPath setLineWidth:secondLineWidth];
        
        [secondPath moveToPoint:firstPoint];
        
        for(NSInteger i = 0; i < secondLineValues.count; i++) {
            NSPoint p = CGPointMake(startX - i*secondLinePointsDistance, [((NSNumber *)[secondLineValues objectAtIndex:i]) floatValue] + 20.0f);
            [secondPath lineToPoint:p];
            [secondPath moveToPoint:p];
        }
        [secondPath closePath];
        [[NSColor colorFromHexString:@"#A866E3"] set];
        [secondPath stroke];
    }
    
}

-(void)preDrawFirstLine {
    
    if(firstLineWidth == 0)
        firstLineWidth = 1;
    if(firstLinePointsDistance == 0)
        firstLinePointsDistance = 2.0f;
    if(!firstLineValues) {
        if(!firstPath) {
            firstPath = [[NSBezierPath alloc] init];
            NSInteger capacity = (self.bounds.size.width-40)/firstLinePointsDistance;
            firstLineValues = [[NSMutableArray alloc] initWithCapacity:capacity];
            for(NSInteger i = 0; i < capacity; i++)
                [firstLineValues addObject:[NSNumber numberWithFloat:(self.bounds.size.height/2)]];
        }
    }
}

-(void)preDrawSecondLine {
    
    if(secondLineWidth == 0)
        secondLineWidth = 1;
    if(secondLinePointsDistance == 0)
        secondLinePointsDistance = 2.0f;
    if(!secondLineValues) {
        if(!secondPath) {
            secondPath = [[NSBezierPath alloc] init];
            NSInteger capacity = (self.bounds.size.width-40)/secondLinePointsDistance;
            secondLineValues = [[NSMutableArray alloc] initWithCapacity:capacity];
            for(NSInteger i = 0; i < capacity; i++)
                [secondLineValues addObject:[NSNumber numberWithFloat:(self.bounds.size.height/2)]];
        }
    }
}

@end
