//
//  NSPopover+MISSINGBackgroundView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 29.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSPopover (MISSINGBackgroundView)

@property (nonatomic, readonly) NSView *backgroundView;
@property (nonatomic) NSColor *backgroundColor;

@end
