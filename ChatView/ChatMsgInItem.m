//
//  ChatMsgInItem.m
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatMsgInItem.h"

@implementation ChatMsgInItem

-(void)viewWillDraw {
    [super viewWillDraw];
    
}

-(void)drawRect:(NSRect)dirtyRect {
    [self setWantsLayer:YES];
    [self.itemImageView setWantsLayer: YES];
    [self.itemImageView.layer setCornerRadius:4];
    self.itemImageView.layer.masksToBounds = YES;
    CGFloat maxLabelWidth = 100;
    [self.itemMessageLabel sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
    [self.layer setMasksToBounds:YES];
    [self setNeedsDisplay:YES];
}

@end
