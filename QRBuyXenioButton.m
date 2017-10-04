//
//  QRBuyXenioButton.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "QRBuyXenioButton.h"
#import "Colours.h"

@implementation QRBuyXenioButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    alphaColor = [NSColor colorFromHexString:@"#333F4F"];
    RGBcolor   = [NSColor colorFromHexString:@"#405067"];
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
