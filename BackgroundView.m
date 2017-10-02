//
//  BackgroundView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

@synthesize nsImageObj;


- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
} // end initWithFrame


- (void)windowDidResize:(NSNotification *)notification {
    // Delegate method
    NSRect zWindowRect = [[self window]frame];
    NSRect zContentRect = [[self window]contentRectForFrameRect:zWindowRect];
    NSRect zRectOfView = NSMakeRect(0.0,0.0,zContentRect.size.width,
                                    zContentRect.size.height);
    [self setFrame:zRectOfView];
    
    [self setNeedsDisplay:YES];
    
} // end windowDidResize


-(void)addImage:(NSImage *)pImage {
    
    self.nsImageObj = pImage;
    NSSize zSizeAspectRatio = NSMakeSize(pImage.size.width,pImage.size.height);
    [[self window]setContentAspectRatio:zSizeAspectRatio];
    [[self window]setContentSize:zSizeAspectRatio];
    
    [self setNeedsDisplay:YES];
    
} // end addImage



- (void)drawRect:(NSRect)dirtyRect {
    if(self.nsImageObj == nil) {
        [[NSColor blueColor]set];
        [NSBezierPath fillRect:[self bounds]];
        return;
    } // end if
    
    [self.nsImageObj drawInRect:[self bounds]
                       fromRect:NSZeroRect
                      operation:NSCompositeCopy
                       fraction:1.0];
    
    
} // end drawRect


@end
