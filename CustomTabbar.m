//
//  CustomTabbar.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 14.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomTabbar.h"
#import "ProfileModalViewController.h"

@implementation CustomTabbar {
    NSPopover *popover;
    ProfileModalViewController *profileModalViewController;
}

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.viewToMove wantsLayer];
    self.selectedTab = 0;
    _viewToMove.layerContentsRedrawPolicy = NSViewLayerContentsRedrawOnSetNeedsDisplay;
    self.tabStore.delegate = self;
    self.tabWallet.delegate = self;
    self.tabFriends.delegate = self;
    self.tabLibrary.delegate = self;
    self.tabSettings.delegate = self;
}
- (IBAction)openPopOverClick:(NSClickGestureRecognizer *)sender {
    popover = [[NSPopover alloc] init];
    [popover setBehavior: NSPopoverBehaviorTransient];
    [popover setDelegate: self];
    profileModalViewController = [[ProfileModalViewController alloc] initWithNibName: @"ProfileModalViewController" bundle: nil];
    [popover setContentViewController: profileModalViewController];
    [popover setContentSize: profileModalViewController.view.frame.size];
    [popover showRelativeToRect: sender.view.frame
                         ofView: self
                  preferredEdge: NSMinYEdge | NSMinXEdge];
}

-(void)tabItemClicked:(NSInteger)viewTag {

    CGFloat dx = 0;
    CGFloat w = 0;

    switch (viewTag) {
        case 0:
            dx = self.tabStore.frame.origin.x - self.viewToMove.frame.origin.x+112;
            w = self.tabStore.frame.size.width;
            break;
        case 1:
            dx = self.tabLibrary.frame.origin.x - self.viewToMove.frame.origin.x+112;
            w = self.tabLibrary.frame.size.width;
            break;
        case 2:
            dx = self.tabWallet.frame.origin.x - self.viewToMove.frame.origin.x+112;
            w = self.tabWallet.frame.size.width;
            break;
        case 3:
            dx = self.tabFriends.frame.origin.x - self.viewToMove.frame.origin.x+112;
            w = self.tabFriends.frame.size.width;
            break;
        case 4:
            dx = self.tabSettings.frame.origin.x - self.viewToMove.frame.origin.x+112;
            w = self.tabSettings.frame.size.width;
            break;
        default:
            dx = 0;
            break;
    }
    [self animateTabViewMove:dx:w];
    self.selectedTab = viewTag;
    if(delegate && [self.delegate respondsToSelector:@selector(tabClicked:)]) {
        [self.delegate tabClicked:viewTag];
    }
}

-(void)animateTabViewMove:(CGFloat)dx:(CGFloat)w {
    CGRect rect = CGRectMake(_viewToMove.frame.origin.x, _viewToMove.frame.origin.y, w, _viewToMove.frame.size.height);
    CGRect rectIV = CGRectMake(_lightLayerIV.frame.origin.x, _lightLayerIV.frame.origin.y, w, _lightLayerIV.frame.size.height);
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        _viewToMove.animator.frame = CGRectOffset(rect, dx, 0);
        _lightLayerIV.animator.frame = CGRectOffset(rectIV, dx, 0);
    } completionHandler:nil];
}

- (IBAction)downloadsClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(downloadsButtonClick)]) {
        [self.delegate downloadsButtonClick];
    }
}

- (IBAction)openChatClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(openChatEvent)]) {
        [self.delegate openChatEvent];
    }
}

@end
