//
//  FreeButton.h
//  XenioUIKit
//
//  Created by Иван Меликов on 27.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"

@interface FreeButton : INSNibLoadedView{
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (weak) IBOutlet NSBox *backgroundBox;

@end
