//
//  SignUpButton.m
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SignUpButton.h"
#import "Colours.h"

@implementation SignUpButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#2565EE"];
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
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.backgroundBox setFillColor:RGBcolor];
}

@end
