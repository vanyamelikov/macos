//
//  ChartView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChartView.h"

@implementation ChartView {
    NSPoint currentPoint;
}

@synthesize barWidth, barMargin;
@synthesize currentPercent;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if(self) {
        [self updateBackBar];
    }
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self preDrawBackBarChart];
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



-(void)preDrawBackBarChart {
    [self.mainBoxView setSubviews:@[]];
    if(self.barWidth == 0)
        self.barWidth = 4;
    if(self.barMargin == 0)
        self.barMargin = 4;
    CGFloat summ = self.barMargin + self.barWidth;
    int count = self.bounds.size.width / summ;
    for(int i = 0; i < count; i ++) {
        NSBox *barBox = [[NSBox alloc] initWithFrame:CGRectMake(summ*i, 0, barWidth, 0)];
        [barBox setBoxType:NSBoxCustom];
        [barBox setFillColor:[NSColor colorFromHexString:@"#1d202b"]];
        [self.mainBox addSubview:barBox];
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


@end
