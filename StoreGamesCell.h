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
#import "AllStopButton.h"
#import "AddGameButton.h"
#import "LLIButton.h"

@interface StoreGamesCell : INSNibLoadedView

@property (strong) IBOutlet NSImageView *gameImage;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet NSView *ratingView;
@property (strong) IBOutlet CancelButton *gameTag;
@property (weak) IBOutlet NSImageView *windowsImage;
@property (strong) IBOutlet NSImageView *macosImage;
@property (strong) IBOutlet NSTextField *priceLabel;
@property (weak) IBOutlet AddGameButton *freeButton;
@property (weak) IBOutlet LLIButton *buyButton;

@end
