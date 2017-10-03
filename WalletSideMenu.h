//
//  WalletSideMenu.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 23.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class WalletSideMenu;
@protocol WalletSideMenuDelegate <NSObject>
- (void) itemClicked: (NSInteger) sender : (NSString *)title;
@end

@interface WalletSideMenu : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@property (nonatomic, weak) id <WalletSideMenuDelegate> delegate;

@end
