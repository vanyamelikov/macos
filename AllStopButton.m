//
//  AllStopButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 13.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "AllStopButton.h"
#import "Colours.h"
#import <QuartzCore/QuartzCore.h>

@implementation AllStopButton

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
    [self.backgroundBox setFillColor:alphaColor];
    [self.hiddenBox setFillColor:alphaColor];
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.backgroundBox setFillColor:RGBcolor];
    [self.hiddenBox setFillColor:RGBcolor];
}
@end
