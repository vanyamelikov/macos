//
//  PassphraseView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "PassphraseView.h"

@implementation PassphraseView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSClickGestureRecognizer *close = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(closeClicked:)];
    [self.closeButton addGestureRecognizer:close];
    
    NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(closeClicked:)];
    [self.continueButton addGestureRecognizer:click];
}

- (void)closeClicked:(id)sender
{
    if(delegate && [self.delegate respondsToSelector:@selector(passphraseViewDismiss)])
       [self.delegate passphraseViewDismiss];
}

@end
