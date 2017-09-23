//
//  StoreSideMenuHeaderCell.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface StoreSideMenuHeaderCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSTextField *label;

@end
