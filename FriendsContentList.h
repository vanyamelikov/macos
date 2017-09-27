//
//  FriendsContentList.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface FriendsContentList : INSNibLoadedView<NSTabViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@end
