//
//  StoreDownloadsCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreDownloadsCell.h"

@implementation StoreDownloadsCell

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self.gameImage setWantsLayer:YES];
    [self.gameImage.layer setCornerRadius:4.0f];
    [self.gameImage.layer setMasksToBounds:YES];
}

@end
