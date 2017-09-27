//
//  StoreMainGridView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreMainGridView.h"

@implementation StoreMainGridView

-(void)awakeFromNib {
    [super awakeFromNib];
    if(self) {
        for (NSView *itemView in self.subviews) {
            if([itemView isKindOfClass:[NSImageView class]]) {
                [itemView setWantsLayer: YES];
                [itemView.layer setCornerRadius:2.0f];
                itemView.layer.masksToBounds = YES;
            }
        }
    }
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        
    }
    return self;
}

@end
