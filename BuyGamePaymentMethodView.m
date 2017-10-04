//
//  BuyGamePaymentMethodView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BuyGamePaymentMethodView.h"

@implementation BuyGamePaymentMethodView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (IBAction)continueToPaymentInformation:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(continueToLastPage)]) {
        [self.delegate continueToLastPage];
    }
}

@end
