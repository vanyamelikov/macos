//
//  ChatSmallView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatSmallView.h"

@implementation ChatSmallView

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

- (void) bringToFront {
    CALayer* superlayer = [[self layer] superlayer];
    [[self layer] removeFromSuperlayer];
    [superlayer addSublayer:[self layer]];
}

@end
