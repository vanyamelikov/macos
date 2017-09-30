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
    [currentView setWantsLayer:YES];
    [newView setWantsLayer:YES];
    [currentView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    [newView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    
    // Move it into place
    [[self animator] replaceSubview:self.subviews[index] with:newView];
}

- (CATransition *)slideAnimation
{
    CATransition *transition = [CATransition animation];
    [transition setDuration:3.0f];
    [transition setType:kCATransitionMoveIn];
    [transition setSubtype:kCATransitionFromRight];
    return transition;
}

@end
