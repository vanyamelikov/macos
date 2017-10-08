//
//  CustomClickableView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomClickableView.h"

@implementation CustomClickableView {
    JMModalOverlay *modalOverlay;
}

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (IBAction)customClickAction:(NSButton *)sender {
    NSStoryboard *friends = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
    NSViewController *friendsVC = [friends instantiateControllerWithIdentifier:@"FriendsModalOverlay"];
    modalOverlay = [[JMModalOverlay alloc] init];
    modalOverlay.contentViewController = friendsVC;
    modalOverlay.animates = YES;
    modalOverlay.animationDirection = JMModalOverlayDirectionBottom;
    modalOverlay.shouldOverlayTitleBar = YES;
    modalOverlay.shouldCloseWhenClickOnBackground = YES;
    //modalOverlay.appearance = [NSAppearance appearanceNamed:NSAppe];
    modalOverlay.backgroundColor = [NSColor colorWithRed:0 green:0 blue:0 alpha:0.9f];
    [modalOverlay showInWindow:self.window];
}

@end
