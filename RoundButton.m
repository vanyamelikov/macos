//
//  RoundButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 13.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "RoundButton.h"
#import "Colours.h"

@implementation RoundButton

BOOL first = YES;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
   
    alphaColor = [NSColor colorFromHexString:@"#f4f4f4"];
    RGBcolor   = [NSColor colorFromHexString:@"#FFFFFF"];
    self.image.tag = 1;
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
    [self.roundButton setFillColor:alphaColor];
   
    if(first == YES){
        [self.image setImage:[NSImage imageNamed:@"ic_playblack"]];
        first = NO;
    }
    else
    {
        first = YES;
        [self.image setImage:[NSImage imageNamed:@"ic_pause"]];
    }
}

-(void)mouseUp:(NSEvent *)theEvent {
    //[self.roundButton setFillColor:RGBcolor];
}


@end
