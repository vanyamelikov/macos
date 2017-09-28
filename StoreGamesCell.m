//
//  StoreGamesCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreGamesCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation StoreGamesCell

-(void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self setWantsLayer:YES];
}

@end
