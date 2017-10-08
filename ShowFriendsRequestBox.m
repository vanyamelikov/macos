//
//  ShowFriendsRequestBox.m
//  XenioUIKit
//
//  Created by Иван Меликов on 05.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ShowFriendsRequestBox.h"

@implementation ShowFriendsRequestBox

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.window makeFirstResponder:self];
}

- (BOOL)acceptsFirstMouse:(NSEvent *)theEvent
{
    return YES;
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

-(void)mouseUp:(NSEvent *)event {
    [super mouseUp:event];
    NSLog(@"Mouse Up");
}

-(void)mouseDown:(NSEvent *)event {
    [super mouseDown:event];
    NSLog(@"Mouse Up");
}

@end
