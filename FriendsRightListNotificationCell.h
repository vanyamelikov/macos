//
//  FriendsRightListNotificationCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface FriendsRightListNotificationCell : INSNibLoadedView

@property (strong) IBOutlet NSImageView *playerImage;
@property (strong) IBOutlet NSTextField *playerNameLabel;
@property (strong) IBOutlet NSTextField *playerachievementLabel;
@property (strong) IBOutlet NSTextField *timeAgoLabel;

@end
