//
//  ChatDialogItem.m
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatDialogItem.h"

@implementation ChatDialogItem

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.dialogAvatarIV setWantsLayer:YES];
    [self.dialogAvatarIV.layer setCornerRadius:3.0f];
    [self.dialogAvatarIV.layer setMasksToBounds:YES];
}

@end
