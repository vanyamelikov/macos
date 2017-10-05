//
//  WebsiteButton.m
//  XenioUIKit
//
//  Created by Иван Меликов on 05.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WebsiteButton.h"
#import "Colours.h"

@implementation WebsiteButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
//    
//    alphaColor = [NSColor colorFromHexString:@"#8DA3ED"];
//    RGBcolor   = [NSColor colorFromHexString:@"#5472ff"];
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
   
}

-(void)mouseUp:(NSEvent *)theEvent {
    
}

@end
