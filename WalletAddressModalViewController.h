//
//  WalletAddressModalViewController.h
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WalletAddressModalViewController;
@protocol WalletAddressModalDelegate <NSObject>
-(void)copyAddressValue;
-(void)pasteAddressValue;
@end

@interface WalletAddressModalViewController : NSViewController
@property (nonatomic, weak) id<WalletAddressModalDelegate> delegate;
@end
