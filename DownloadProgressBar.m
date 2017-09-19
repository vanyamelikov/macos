//
//  DownloadProgressBar.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "DownloadProgressBar.h"


@implementation DownloadProgressBar


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    CGFloat percentWidth = self.bounds.size.width/100;
    self.fillLineBox.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.progressValue*percentWidth, self.bounds.size.height);
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    if(self = [super initWithCoder:coder]) {
        self.fillLineBox.frame = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 0, self.bounds.size.height);
        self.emptyLineView.frame = CGRectMake(self.bounds.origin.x, (self.bounds.size.height/2) - (self.emptyLineHeight / 2), self.bounds.size.width, self.emptyLineHeight);
        
        [self.emptyLineView setFillColor:[NSColor colorFromHexString:self.emptyLineColor]];
        [self.fillLineBox setFillColor:[NSColor colorFromHexString:self.fillLineColor]];
    }
    return self;
}
     
@end
