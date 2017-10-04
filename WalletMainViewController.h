//
//  WalletMainViewController.h
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WalletSendMoneyView.h"
#import "WalletHistory.h"
#import "ReceiveView.h"

@interface WalletMainViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource, WalletSendMoneyViewDelegate>
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet WalletSendMoneyView *sendMoneyView;
@property (weak) IBOutlet WalletHistory *historyView;
@property (weak) IBOutlet ReceiveView *receiveView;


@end
