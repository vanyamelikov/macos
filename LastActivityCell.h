//
//  LastActivityCell.h
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "ActivityTag.h"

@interface LastActivityCell : INSNibLoadedView

@property (weak) IBOutlet NSImageView *image;
@property (weak) IBOutlet NSTextField *activityNameLabel;
@property (weak) IBOutlet NSTextField *agoTimeLabel;
@property (weak) IBOutlet NSTextField *totalTimeLabel;


@end
