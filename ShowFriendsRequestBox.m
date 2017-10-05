//
//  ShowFriendsRequestBox.m
//  XenioUIKit
//
//  Created by Иван Меликов on 05.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ShowFriendsRequestBox.h"

@implementation ShowFriendsRequestBox{
    JMModalOverlay *modalOverlay;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)mouseDown:(NSEvent *)event {
    NSLog(@"Mouse Down");
}

-(void)mouseUp:(NSEvent *)event {
    NSLog(@"Mouse Up");
    NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
    NSViewController *friendsVC = [friends instantiateControllerWithIdentifier:@"FriendsModalOverlay"];
    modalOverlay.contentViewController = friendsVC;
    modalOverlay.animates = YES;
    modalOverlay.animationDirection = JMModalOverlayDirectionBottom;
    modalOverlay.shouldOverlayTitleBar = YES;
    modalOverlay.shouldCloseWhenClickOnBackground = NO;
    modalOverlay.appearance = [NSAppearance appearanceNamed:NSAppearanceNameVibrantDark];
    modalOverlay.backgroundColor = [NSColor colorWithCalibratedWhite:0.0 alpha:0.0];
    [modalOverlay showInWindow:self.window];
}

@end
