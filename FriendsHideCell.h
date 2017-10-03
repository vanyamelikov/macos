//
//  FriendsHideCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface FriendsHideCell : INSNibLoadedView

@property (strong) IBOutlet NSTextField *label;
@property (strong) IBOutlet NSBox *arrowDown;
@property (weak) IBOutlet NSImageView *sisclosureImageView;

@end
