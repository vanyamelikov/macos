//
//  XenioBackgroundView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import <QuartzCore/QuartzCore.h>

@interface XenioBackgroundView : NSView

//Gradient Layer Properties
@property (nonatomic) IBInspectable NSColor *startGradientColor;
@property (nonatomic) IBInspectable NSColor *endGradientColor;
@property (nonatomic) IBInspectable float gradientOpacity;

//Solid Layer Properties
@property (nonatomic) IBInspectable NSColor *solidColor;
@property (nonatomic) IBInspectable float solidOpacity;

//Blurred Image Properties
@property (nonatomic) IBInspectable NSImage *blurredImage;
@property (nonatomic) IBInspectable float imageTransparency;
@property (nonatomic) IBInspectable float blurRadius;

@end
