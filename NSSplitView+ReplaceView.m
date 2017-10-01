//
//  NSSplitViewController+ReplaceView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 30.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSSplitView+ReplaceView.h"

@implementation NSSplitView (ReplaceView)

-(void)replaceSplitViewItemAtIndex:(NSInteger)index withViewController:(NSViewController*)newViewController {
    assert(index <= [self.subviews count]);

    // Set up the frame
    NSRect frame = self.subviews[index].frame;
    NSView *newView = newViewController.view;
    newView.frame = frame;
    
    //Set Up Animations
    NSView *currentView = self.subviews[index];
    [self setWantsLayer:YES];
    [currentView setWantsLayer:YES];
    [newView setWantsLayer:YES];
    [currentView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    [newView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    
    [self setNeedsDisplay:YES];
    [currentView setNeedsDisplay:YES];
    [newView setNeedsDisplay:YES];
    
    // Move it into place
    currentView.alphaValue = 1.0f;
    newView.alphaValue = 0.0f;
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.6f;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [currentView.animator setAlphaValue:0.0f];
        [[self animator] replaceSubview:self.subviews[index] with:newView];
        [newView.animator setAlphaValue:1.0f];
    } completionHandler:^{
        currentView.alphaValue = 1.0f;
        newView.alphaValue = 1.0f;
    }];
}

@end
