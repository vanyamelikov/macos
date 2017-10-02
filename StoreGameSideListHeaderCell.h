//
//  StoreGameSideListHeaderCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface StoreGameSideListHeaderCell : INSNibLoadedView

@property (strong) IBOutlet NSTextField *label;
@property (strong) IBOutlet NSBox *backgroundBox;

@end
