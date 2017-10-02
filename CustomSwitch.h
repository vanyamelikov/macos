//
//  CustomSwitch.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import <QuartzCore/QuartzCore.h>

@interface CustomSwitch : INSNibLoadedView
@property (strong) IBOutlet NSTextField *firstLabel;
@property (strong) IBOutlet NSTextField *secondLabel;
@property (strong) IBOutlet NSBox *bgBox;

@end
