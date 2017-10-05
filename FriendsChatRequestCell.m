//
//  FriendsChatRequestCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsChatRequestCell.h"

@implementation FriendsChatRequestCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.playerImage setWantsLayer:YES];
    [self.playerImage.layer setCornerRadius:3.0f];
    [self.playerImage.layer setMasksToBounds:YES];
}

@end
