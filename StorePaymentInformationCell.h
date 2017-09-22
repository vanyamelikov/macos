//
//  StorePaymentInformationCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface StorePaymentInformationCell : INSNibLoadedView
@property (strong) IBOutlet NSImageView *gameImage;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet NSImageView *windowsImage;
@property (strong) IBOutlet NSImageView *macosImage;
@property (strong) IBOutlet NSTextField *priceLabel;

@end
