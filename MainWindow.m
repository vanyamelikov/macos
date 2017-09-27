//
//  MainWindow.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "MainWindow.h"

@implementation MainWindow

-(void)awakeFromNib {
    [super awakeFromNib];
    if(self.backgroundImageName != nil)
        [self setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:self.backgroundImageName]]];
    else
        [self setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"Background"]]];
}

-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

-(void)changeBackgroundImage : (NSString *)imageName {
    [self setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:imageName]]];
}


@end
