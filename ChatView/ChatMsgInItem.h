//
//  ChatMsgInItem.h
//  XenioUIKit
//
//  Created by Иван Меликов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface ChatMsgInItem : INSNibLoadedView
@property (weak) IBOutlet NSImageView *itemImageView;
@property (weak) IBOutlet NSTextField *itemMessageLabel;
@property (weak) IBOutlet NSBox *roundedBox;
@end
