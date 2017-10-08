//
//  ChatDialogItem.h
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface ChatDialogItem : INSNibLoadedView
@property (weak) IBOutlet NSImageView *dialogAvatarIV;
@property (weak) IBOutlet NSTextField *dialogNameLabel;
@property (weak) IBOutlet NSTextField *dialogStatusLabel;
@property (weak) IBOutlet NSImageView *dialogCloseIV;
@property (weak) IBOutlet NSImageView *dialogLightLayer;

@end
