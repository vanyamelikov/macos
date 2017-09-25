//
//  SettingsNavigationListView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface SettingsNavigationListView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
