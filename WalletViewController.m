//
//  WalletViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletViewController.h"
#import "WalletHistory.h"
#import "ReceiveView.h"
#import "NSSplitView+ReplaceView.h"
#import "WalletSideMenu.h"

@interface WalletViewController ()

@end

@implementation WalletViewController {
    WalletHistory *walletHistory;
    ReceiveView *receiveView;
    NSView *walletSend;
    NSSplitView *superSplitView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    superSplitView = (NSSplitView *)self.view.subviews[0];
    walletHistory = [[WalletHistory alloc] initWithFrame:superSplitView.subviews[1].frame];
    receiveView = [[ReceiveView alloc] initWithFrame:superSplitView.subviews[1].frame];
    walletSend = superSplitView.subviews[1];
    
    
}

-(void)viewDidAppear {
    [super viewDidAppear];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeWalletPage:)
                                                 name:@"changeWalletPage"
                                               object:nil];
}

- (void) changeWalletPage:(NSNotification *) notification{
    if ([[notification name] isEqualToString:@"changeWalletPage"]) {
        NSInteger index = [notification.object integerValue];
        if(index == 2) {
            [superSplitView replaceSplitViewItemAtIndex:1 withViewController:receiveView];
        } else if(index == 3) {
            [superSplitView replaceSplitViewItemAtIndex:1 withViewController:walletHistory];
        } else {
            [superSplitView replaceSplitViewItemAtIndex:1 withViewController:walletSend];
        }
        [superSplitView setNeedsDisplay:YES];
    }
        
}

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //[super dealloc];
}

@end








