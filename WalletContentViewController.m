//
//  WalletContentViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletContentViewController.h"

@interface WalletContentViewController ()

@end

@implementation WalletContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.walletHistoryView.hidden = YES;
    self.firstSendMoneyView.hidden = NO;
    self.chooseFriendView.hidden = YES;
    
    [self.friendImage setImage:[NSImage imageNamed:@"ic_userpic"]];

    NSClickGestureRecognizer *imageClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(imageAction:)];
    [self.friendImage addGestureRecognizer:imageClick];

    NSClickGestureRecognizer *sendMoneyClick = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(sendMoneyButtonClick:)];
    [self.sendMoneyButton addGestureRecognizer:sendMoneyClick];
}

- (void)imageAction:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.firstSendMoneyView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.firstSendMoneyView.hidden = YES;
                            self.chooseFriendView.hidden = NO;
                            self.firstSendMoneyView.alphaValue = 1;
                        }];
    
}

- (void)sendMoneyButtonClick:(id)sender
{
    [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
        context.duration = 0.5f;
        self.chooseFriendView.animator.alphaValue = 0;
    }
                        completionHandler:^{
                            self.chooseFriendView.hidden = YES;
                            self.firstSendMoneyView.hidden = NO;
                            self.chooseFriendView.alphaValue = 1;
                        }];
    [self.friendImage setImage:[NSImage imageNamed:@"img_cf_a1"]];
}

@end
