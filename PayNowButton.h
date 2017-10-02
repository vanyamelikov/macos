//
//  PayNowButton.h
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "Colours.h"

@interface PayNowButton : INSNibLoadedView {
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;


@end
