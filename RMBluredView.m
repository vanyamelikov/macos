//
//  RMBluredView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "RMBluredView.h"

#define kRMBlurredViewDefaultTintColor [NSColor colorWithRed:0 green:0 blue:0 alpha:0.8]
#define kRMBlurredViewDefaultSaturationFactor 2.0
#define kRMBlurredViewDefaultBlurRadius 10.0

@implementation RMBluredView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void) setTintColor:(NSColor *)tintColor {
    _tintColor = tintColor;
    
    // Since we need a CGColor reference, store it for the drawing of the layer.
    if (_tintColor) {
        [self.layer setBackgroundColor:_tintColor.CGColor];
    }
    
    // Trigger a re-drawing of the layer
    [self.layer setNeedsDisplay];
}

- (void) setBlurRadius:(float)blurRadius {
    // Setting the blur radius requires a resetting of the filters
    _blurRadius = blurRadius;
    [self resetFilters];
}

- (void) setBlurRadiusNumber:(NSNumber *)blurRadiusNumber {
    [self setBlurRadius:blurRadiusNumber.floatValue];
}

- (void) setSaturationFactor:(float)saturationFactor {
    // Setting the saturation factor also requires a resetting of the filters
    _saturationFactor = saturationFactor;
    [self resetFilters];
}

- (void) setSaturationFactorNumber:(NSNumber *)saturationFactorNumber {
    [self setSaturationFactor:saturationFactorNumber.floatValue];
}

- (void) setUp {
    // Instantiate a new CALayer and set it as the NSView's layer (layer-hosting)
    _hostedLayer = [CALayer layer];
    [self setWantsLayer:YES];
    [self setLayer:_hostedLayer];
    
    // Set up the default parameters
    _blurRadius = kRMBlurredViewDefaultBlurRadius;
    _saturationFactor = kRMBlurredViewDefaultSaturationFactor;
    [self setTintColor:[NSColor colorWithCalibratedWhite:1 alpha:0.7]];
    
    // It's important to set the layer to mask to its bounds, otherwise the whole parent view might get blurred
    [self.layer setMasksToBounds:YES];
    
    // To apply CIFilters on OS X 10.9, we need to set the property accordingly:
    if ([self respondsToSelector:@selector(setLayerUsesCoreImageFilters:)]) {
        BOOL flag = YES;
        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:@selector(setLayerUsesCoreImageFilters:)]];
        [inv setSelector:@selector(setLayerUsesCoreImageFilters:)];
        [inv setArgument:&flag atIndex:2];
        [inv invokeWithTarget:self];
    }
    
    // Set the layer to redraw itself once it's size is changed
    [self.layer setNeedsDisplayOnBoundsChange:YES];
    
    // Initially create the filter instances
    [self resetFilters];
}

- (void) resetFilters {
    
    // To get a higher color saturation, we create a ColorControls filter
    _saturationFilter = [CIFilter filterWithName:@"CIColorControls"];
    [_saturationFilter setDefaults];
    [_saturationFilter setValue:[NSNumber numberWithFloat:_saturationFactor] forKey:@"inputSaturation"];
    
    // Next, we create the blur filter
    _blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [_blurFilter setDefaults];
    [_blurFilter setValue:[NSNumber numberWithFloat:_blurRadius] forKey:@"inputRadius"];
    
    // Now we apply the two filters as the layer's background filters
    [self.layer setBackgroundFilters:@[_saturationFilter, _blurFilter]];
    
    // ... and trigger a refresh
    [self.layer setNeedsDisplay];
}

@end
