//
//  BuyGameMainView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BuyGameMainView.h"

@implementation BuyGameMainView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(void)viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    
}

-(void)viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    
}
- (IBAction)preOrderButtonClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(preOrderClick)]) {
        [self.delegate preOrderClick];
    }
}

@end
