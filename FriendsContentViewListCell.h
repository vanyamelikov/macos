//
//  FriendsContentViewListCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "PlayerStatusNotHere.h"
#import "PlayerStatusOffline.h"
#import "PlayerStatusOnline.h"
#import "PlayerStatusWantsToPlay.h"
#import "PlayerStatusInGame.h"

@interface FriendsContentViewListCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSImageView *playerImage;
@property (strong) IBOutlet NSTextField *playerNameLabel;
@property (weak) IBOutlet NSTextField *gameNameLabel;
@property (weak) IBOutlet PlayerStatusNotHere *status0;
@property (weak) IBOutlet PlayerStatusOffline *status1;
@property (weak) IBOutlet PlayerStatusOnline *status2;
@property (weak) IBOutlet PlayerStatusWantsToPlay *status3;
@property (weak) IBOutlet PlayerStatusInGame *status4;


@end
