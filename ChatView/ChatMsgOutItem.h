//
//  ChatMsgOutItem.h
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface ChatMsgOutItem : INSNibLoadedView
@property (weak) IBOutlet NSTextField *itemMessageLabel;
@property (weak) IBOutlet NSBox *chatMessageBox;
@end
