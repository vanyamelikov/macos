//
//  SettingsButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 12.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "SettingsButton.h"
#import "Colours.h"

@implementation SettingsButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#09171A"];
    RGBcolor   = [NSColor colorFromHexString:@"#253443"];
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
