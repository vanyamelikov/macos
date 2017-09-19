//
//  TabItemView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "TabItemView.h"

@implementation TabItemView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

-(void) mouseUp:(NSEvent *)event {
    if(delegate && [self.delegate respondsToSelector:@selector(tabItemClicked:)]) {
        [self.delegate tabItemClicked:self.viewTag];
    }
}

@end
