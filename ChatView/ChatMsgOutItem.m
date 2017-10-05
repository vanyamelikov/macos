//
//  ChatMsgOutItem.m
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatMsgOutItem.h"

@implementation ChatMsgOutItem

-(void)viewWillDraw {
    [super viewWillDraw];
    
}

-(void)drawRect:(NSRect)dirtyRect {
    [self setWantsLayer:YES];
    [self.itemMessageLabel setWantsLayer:YES];
    [self.itemMessageLabel sizeToFit];
    [self.layer setMasksToBounds:YES];
    [self setNeedsDisplay:YES];
}

@end
