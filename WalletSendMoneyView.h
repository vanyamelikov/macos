//
//  WalletSendMoneyView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "ChooseFriendButton.h"
#import "WalletAddressModalViewController.h"

@class WalletSendMoneyView;
@protocol WalletSendMoneyViewDelegate <NSObject>
-(void)chooseFriend;
@end

@interface WalletSendMoneyView : INSNibLoadedView <NSPopoverDelegate, WalletAddressModalDelegate>
@property (nonatomic, weak) id<WalletSendMoneyViewDelegate> delegate;

@property (weak) IBOutlet NSView *sendMoneyView;
@property (weak) IBOutlet NSView *chooseFriendView;
@property (weak) IBOutlet NSImageView *chooseFriendImage;
@property (weak) IBOutlet ChooseFriendButton *chooseFriendButton;
@property (weak) IBOutlet NSTextField *addressTextField;

@property (weak) IBOutlet NSSlider *moneySlider;
@property (weak) IBOutlet NSTextField *transferTextLabel;
@property (weak) IBOutlet NSBox *transferImageBack;
@property (weak) IBOutlet NSImageView *transferImageView;

@end
