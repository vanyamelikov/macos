//
//  CustomSwitch.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomSwitch.h"

@implementation CustomSwitch{
    NSRect firstLabelFrame;
    NSRect secondLabelFrame;
    BOOL onFirst;
}

- (instancetype) initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    
    if(self) {
        [self initView];
    }
    return self;
}

- (instancetype) initWithFrame:(NSRect)frameRect{
    self = [super initWithFrame: frameRect];
    
    if(self) {
        [self initView];
    }
    return self;
}

- (void) awakeFromNib{
    [super awakeFromNib];
    [self initView];
}

- (void) initView{
    onFirst = YES;
    firstLabelFrame = self.firstLabel.frame;
    secondLabelFrame = self.secondLabel.frame;
}

- (IBAction)firstLabelClick:(id)sender {
    onFirst = YES;
    [self setBoxPosition];
}

- (IBAction)secondLabelClick:(id)sender {
    onFirst = NO;
    [self setBoxPosition];
}

- (void) setBoxPosition{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext * _Nonnull context) {
        context.duration = 0.3f;
        context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        if(onFirst){
            self.bgBox.animator.frame = CGRectMake(firstLabelFrame.origin.x, firstLabelFrame.origin.y, self.bgBox.frame.size.width, self.bgBox.frame.size.height);
        } else {
            self.bgBox.animator.frame = CGRectMake(secondLabelFrame.origin.x, secondLabelFrame.origin.y, self.bgBox.frame.size.width, self.bgBox.frame.size.height);
        }
    } completionHandler:^{
        
    }];
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
