//
//  LLIButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 12.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LLIButton.h"
#import "Colours.h"
#import <QuartzCore/QuartzCore.h>

@implementation LLIButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#3263CA"];
    RGBcolor   = [NSColor colorFromHexString:@"#3D7BFF"];
}

-(void)mouseEntered:(NSEvent *)theEvent {
    //draw rollover
    NSLog(@"Mouse entered");
}

-(void)mouseExited:(NSEvent *)theEvent {
    //draw normal
    NSLog(@"Mouse exited");
}

-(void)mouseDown:(NSEvent *)theEvent {
    [self.hiddenBox setFillColor:alphaColor];
    [self.backgroundBox setFillColor:alphaColor];
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.hiddenBox setFillColor:RGBcolor];
    [self.backgroundBox setFillColor:RGBcolor];
}

@end
