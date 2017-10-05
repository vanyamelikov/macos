//
//  WalletSendMoneyView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletSendMoneyView.h"
#import "Colours.h"

@implementation WalletSendMoneyView

@synthesize delegate;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSClickGestureRecognizer *sendMoneyClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(inputChooseFriendClick:)];
    [self.chooseFriendImage addGestureRecognizer:sendMoneyClick];
    
    NSClickGestureRecognizer *chooseFriend = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(chooseFriendAction:)];
    [self.chooseFriendButton addGestureRecognizer:chooseFriend];
}



- (void)inputChooseFriendClick:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.sendMoneyView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.sendMoneyView.hidden = YES;
                            self.chooseFriendView.hidden = NO;
                            self.sendMoneyView.alphaValue = 1;
                        }];
    
}
- (IBAction)sliderAction:(NSSlider *)sender {
    if(sender.floatValue >= 0.5) {
        //ic_transfer_fast
        [self.transferImageBack setFillColor:[NSColor colorFromHexString:@"e2907a"]];
        [self.transferImageView setImage:[NSImage imageNamed:@"ic_transfer"]];
        [self.transferTextLabel setStringValue:@"Fast transfer"];
    } else {
        [self.transferImageBack setFillColor:[NSColor colorFromHexString:@"5498d5"]];
        [self.transferImageView setImage:[NSImage imageNamed:@"ic_transfer_fast"]];
        [self.transferTextLabel setStringValue:@"Average transfer"];
    }
}

- (void)chooseFriendAction:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.chooseFriendView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.chooseFriendView.hidden = YES;
                            self.sendMoneyView.hidden = NO;
                            self.chooseFriendView.alphaValue = 1;
                        }];
    [self.chooseFriendImage setImage:[NSImage imageNamed:@"img_wallet_friend_2"]];
}


@end
