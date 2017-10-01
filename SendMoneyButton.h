//
//  SendMoneyButton.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 25.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface SendMoneyButton : INSNibLoadedView {
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;

@end
