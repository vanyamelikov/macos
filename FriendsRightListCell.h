//
//  FriendsRightListCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface FriendsRightListCell : INSNibLoadedView

@property (strong) IBOutlet NSImageView *playerImage;
@property (strong) IBOutlet NSTextField *playerNameLabel;
@property (strong) IBOutlet NSTextField *playerStatusLabel;
@property (strong) IBOutlet NSTextField *gameLabel;

@end
