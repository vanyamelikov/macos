//
//  LibraryGamesRightMenuCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface LibraryGamesRightMenuCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSTextField *label;
@property (strong) IBOutlet NSImageView *lightLayer;

@end