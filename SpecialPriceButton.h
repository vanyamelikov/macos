//
//  SpecialPriceButton.h
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface SpecialPriceButton : INSNibLoadedView{
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;


@end
