//
//  StoreSideMenu.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@class StoreSideMenu;
@protocol StoreSideMenuDelegate <NSObject>
- (void) itemClicked: (NSInteger) sender;
@end

@interface StoreSideMenu : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@property (nonatomic, weak) id <StoreSideMenuDelegate> delegate;

@end
