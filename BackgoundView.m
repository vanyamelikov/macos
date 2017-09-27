//
//  BackgoundView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BackgoundView.h"

@implementation BackgoundView

- (void)drawRect:(NSRect)dirtyRect {
    NSColor *backgroundColor = [NSColor colorWithPatternImage:[NSImage imageNamed:@"nfs"]];
    [backgroundColor setFill];
    NSRectFill(dirtyRect);
    
    [super drawRect:dirtyRect];
}

@end
