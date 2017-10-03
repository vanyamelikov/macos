//
//  NSPopover+XenioPopover.m
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSPopover+XenioPopover.h"

@implementation NSPopover (XenioPopover)

-(void)showXenioPopover:(NSView *)view frameSize:(NSSize)rect animated:(BOOL)animated{
    self.behavior = NSPopoverBehaviorTransient;
    self.animates = animated;
    self.contentViewController = [[NSViewController alloc] init];
    [self.contentViewController.view addSubview:view];
    self.contentSize = rect;
    
}

@end
