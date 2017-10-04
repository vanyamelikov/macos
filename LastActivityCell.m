//
//  LastActivityCell.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LastActivityCell.h"

@implementation LastActivityCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.image setWantsLayer:YES];
    [self.image.layer setCornerRadius:10.0f];
    [self.image.layer setMasksToBounds:YES];
}

@end
