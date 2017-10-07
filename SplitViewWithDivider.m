//
//  SplitViewWithDivider.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SplitViewWithDivider.h"
#import "Colours.h"

@implementation SplitViewWithDivider


-(void) drawDividerInRect:(NSRect)aRect {
    [[NSColor colorWithRed:(255/255) green:(255/255) blue:(255/255) alpha:0.0f] set];
    NSRectFill(aRect);
    [self setNeedsDisplayInRect:aRect];
}

//-(instancetype)initWithCoder:(NSCoder *)decoder {
//    self = [super initWithCoder:decoder];
//    if(self) {
//        [self setWantsLayer:YES];
//        [self setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
//    }
//    return self;
//}

@end
