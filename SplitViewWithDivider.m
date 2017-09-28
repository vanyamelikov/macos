//
//  SplitViewWithDivider.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SplitViewWithDivider.h"

@implementation SplitViewWithDivider

-(void) drawRect {
    id topView = [[self subviews] objectAtIndex:0];
    NSRect topViewFrameRect = [topView frame];
    [self drawDividerInRect:NSMakeRect(topViewFrameRect.origin.x, topViewFrameRect.size.height, topViewFrameRect.size.width, [self dividerThickness] )];
}

-(void) drawDividerInRect:(NSRect)aRect {
    [[NSColor colorWithRed:255 green:255 blue:255 alpha:0.15] set];
    NSRectFill(aRect);
}

@end
