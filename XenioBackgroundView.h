//
//  XenioBackgroundView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import <QuartzCore/QuartzCore.h>

@interface XenioBackgroundView : INSNibLoadedView
@property (weak) IBOutlet NSBox *solidLayer;
@property (weak) IBOutlet NSImageView *bluredImageView;
@property (weak) IBOutlet NSBox *gradientLayer;

//Gradient Layer Properties
@property (nonatomic) IBInspectable NSColor *startGradientColor;
@property (nonatomic) IBInspectable NSColor *endGradientColor;
@property (nonatomic) IBInspectable CGFloat gradientAngle;
@property (nonatomic) IBInspectable CGFloat gradientOpacity;

//Solid Layer Properties
@property (nonatomic) IBInspectable NSColor *solidColor;
@property (nonatomic) IBInspectable CGFloat solidOpacity;

//Blurred Image Properties
@property (nonatomic) IBInspectable NSImage *blurredImage;
@property (nonatomic) IBInspectable CGFloat imageTransparency;
@property (nonatomic) IBInspectable CGFloat blurRadius;

@end
