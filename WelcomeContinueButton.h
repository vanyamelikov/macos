//
//  WelcomeContinueButton.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"

@interface WelcomeContinueButton : INSNibLoadedView{
NSColor *RGBcolor;
NSColor *alphaColor;
}

@property (strong) IBOutlet NSTextField *continueLabel;

@end
