//
//  PaymentInformationView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "PaymentInformationView.h"

@implementation PaymentInformationView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (IBAction)openMainStore:(id)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(openMainStoreViewController)]) {
        [self.delegate openMainStoreViewController];
    }
}

@end
