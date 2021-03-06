//
//  SendMoneyButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SendMoneyButton.h"
#import "Colours.h"

@implementation SendMoneyButton

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
