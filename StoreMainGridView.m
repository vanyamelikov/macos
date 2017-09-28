//
//  StoreMainGridView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreMainGridView.h"

@implementation StoreMainGridView {
    NSArray *items;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    if(self) {
        items = @[self.storeImage1,
                  self.storeImage2,
                  self.storeImage3,
                  self.storeImage4,
                  self.storeImage5,
                  self.storeImage6,
                  self.storeImage7,
                  self.storeImage8,
                  self.storeImage9];
        for (NSView *itemView in items) {
             [itemView setWantsLayer: YES];
             [itemView.layer setCornerRadius:2.0f];
             itemView.layer.masksToBounds = YES;
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
