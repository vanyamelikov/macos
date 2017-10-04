//
//  BuyGameQRView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BuyGameQRView.h"

@implementation BuyGameQRView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (IBAction)continueButtonClick:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(continueToPaymentInfo)]) {
        [self.delegate continueToPaymentInfo];
    }
}


@end
