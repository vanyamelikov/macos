//
//  WindowViewSubclass.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WindowViewSubclass.h"

@implementation WindowViewSubclass

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:[NSColor orangeColor] endingColor:[NSColor lightGrayColor]];
    NSRect windowFrame = [self frame];
    [gradient drawInRect:windowFrame angle:90];
}

@end
