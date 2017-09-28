//
//  CustomScrollView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

- (void)reflectScrolledClipView:(NSClipView *)aClipView
{
    [super reflectScrolledClipView:aClipView];
    [self.refreshView setNeedsDisplay:YES];
}

@end
