//
//  StoreGamesCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 21.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "CancelButton.h"
#import "SaveSettingsButton.h"

@interface StoreGamesCell : INSNibLoadedView

@property (strong) IBOutlet NSImageView *gameImage;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet NSView *ratingView;
@property (strong) IBOutlet CancelButton *gameTag;
@property (strong) IBOutlet NSLayoutConstraint *windowsImage;
@property (strong) IBOutlet NSImageView *macosImage;
@property (strong) IBOutlet NSTextField *priceLabel;
@property (strong) IBOutlet SaveSettingsButton *button;

@end
