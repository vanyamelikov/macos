//
//  WalletContentViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WalletHistoryView.h"
#import "SendMoneyButton.h"

@interface WalletContentViewController : NSViewController

@property (strong) IBOutlet NSTextField *categoryLabel;
@property (strong) IBOutlet NSTextField *amountLabel;
@property (strong) IBOutlet NSTextField *xnoLabel;

@property (strong) IBOutlet WalletHistoryView *walletHistoryView;
@property (strong) IBOutlet NSView *firstSendMoneyView;
@property (strong) IBOutlet NSView *chooseFriendView;
//@property (strong) IBOutlet NSBox *friendImageBox;
@property (strong) IBOutlet NSImageView *friendImage;
@property (strong) IBOutlet SendMoneyButton *sendMoneyButton;
@property (weak) IBOutlet NSImageView *userpicImage;

@end
