//
//  HeaderCell.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 20.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell

- (void)drawRect:(NSRect)dirtyRect {
    //[super drawRect:dirtyRect];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [_headerTitle setStringValue:@"Hello"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        
    }
    return self;
}

@end
