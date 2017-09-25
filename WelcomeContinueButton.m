//
//  WelcomeContinueButton.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WelcomeContinueButton.h"
#import "Colours.h"

@implementation WelcomeContinueButton

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
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
    [self.continueLabel setTextColor:[NSColor gridColor]];
}

-(void)mouseUp:(NSEvent *)theEvent {
    [self.continueLabel setTextColor:[NSColor whiteColor]];
}

@end
