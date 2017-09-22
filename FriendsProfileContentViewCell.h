//
//  FriendsProfileContentViewCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "GameTagImageView.h"

@interface FriendsProfileContentViewCell : INSNibLoadedView

@property (strong) IBOutlet NSImageView *gameImage;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet GameTagImageView *gameTagView;
@property (strong) IBOutlet NSTextField *timeAgoLabel;
@property (strong) IBOutlet NSTextField *totalHoursLabel;

@end
