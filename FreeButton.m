//
//  FreeButton.m
//  XenioUIKit
//
//  Created by Иван Меликов on 27.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FreeButton.h"
#import "Colours.h"

@implementation FreeButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#4F7A24"];
    RGBcolor   = [NSColor colorFromHexString:@"#69AE3B"];
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
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.backgroundBox setFillColor:RGBcolor];
}

@end
