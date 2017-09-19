//
//  RemoveButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 13.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "RemoveButton.h"
#import "Colours.h"

@implementation RemoveButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#B76C61"];
    RGBcolor   = [NSColor colorFromHexString:@"#E9726A"];
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
