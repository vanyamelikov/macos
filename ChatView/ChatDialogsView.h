//
//  ChatDialogsView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "ChatDialogItem.h"
#import "ChatDialogModel.h"

@interface ChatDialogsView : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>
@property (weak) IBOutlet NSTableView *tableView;
@end
