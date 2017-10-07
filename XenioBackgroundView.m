//
//  XenioBackgroundView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "XenioBackgroundView.h"
#import <CoreImage/CoreImage.h>
#import <QuartzCore/QuartzCore.h>

@implementation XenioBackgroundView {
    CALayer *solidLayer;
    CAGradientLayer *gradientLayer;
    CALayer *blurredImageLayer;
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        
    }
    return self;
}

-(void)drawRect:(NSRect)dirtyRect {
    [self setWantsLayer:YES];
    if(!solidLayer) {
        [self addSolidRectangleWithColor:self.solidColor
                              andOpacity:self.solidOpacity];
    } else {
        [solidLayer setFrame:dirtyRect];
        [solidLayer setNeedsDisplay];
    }
    
    if(!blurredImageLayer) {
        [self addBlurredImageViewWithImage:self.blurredImage
                                blurRadius:self.blurRadius
                                   opacity:self.imageTransparency];
    } else {
        [blurredImageLayer setFrame:dirtyRect];
        [blurredImageLayer setNeedsDisplay];
    }
    
    if(!gradientLayer) {
        [self addRectangleGradientWithStartColor:self.startGradientColor
                                        endColor:self.endGradientColor
                                      andOpacity:self.gradientOpacity];
    } else {
        [gradientLayer setFrame:dirtyRect];
        [gradientLayer setNeedsDisplay];
    }
    [self setNeedsDisplayInRect:dirtyRect];
    [self setNeedsUpdateConstraints:YES];
    [self setNeedsLayout:YES];
    [super drawRect:dirtyRect];
    
}

-(void)initView {
    if(!self.startGradientColor)
        self.startGradientColor = [NSColor clearColor];
    if(!self.endGradientColor)
        self.endGradientColor = [NSColor clearColor];
    if(!self.gradientOpacity)
        self.gradientOpacity = 0.0f;
    
    if(!self.solidColor)
        self.solidColor = [NSColor clearColor];
    if(!self.solidOpacity)
        self.solidOpacity = 1.0f;
    
    if(!self.imageTransparency)
        self.imageTransparency = 1.0f;
    
    if(!self.blurRadius)
        self.blurRadius = 0.0f;
    
}


//Set Solid Layer Background Color
-(void)addSolidRectangleWithColor:(NSColor *)color
                        andOpacity:(CGFloat)opacity {
    [self setWantsLayer:YES];
    
    solidLayer = [CALayer layer];
    
    [solidLayer setMasksToBounds:YES];
    [solidLayer setBackgroundColor:color.CGColor];
    [solidLayer setOpacity:opacity];

    [self.layer addSublayer:solidLayer];
}

//Set Blured and transparented ImageView
-(void)addBlurredImageViewWithImage:(NSImage *)image
                          blurRadius:(float)radius
                             opacity:(float)opacity {
    [self setWantsLayer:YES];
    
    blurredImageLayer = [CALayer layer];

    [blurredImageLayer setMasksToBounds:YES];
    
    [blurredImageLayer setContents:(id)[self rBlurredImage:image:radius]];
    
    [blurredImageLayer setOpacity:opacity];
    
    [self.layer addSublayer:blurredImageLayer];
}

//Set gradient layer
-(void)addRectangleGradientWithStartColor:(NSColor *)startColor
                                 endColor:(NSColor *)endColor
                               andOpacity:(CGFloat)opacity {
    [self setWantsLayer:YES];
    
    gradientLayer = [CAGradientLayer layer];
    
    [gradientLayer setMasksToBounds:YES];
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[startColor CGColor],
                              (id)[endColor CGColor], nil]];
    [gradientLayer setOpacity:opacity];
    
    [self.layer addSublayer:gradientLayer];
}

#pragma mark - Image Work

//Create CGImageRef from NSImage
-(CGImageRef)nsImageToCGImageRef :(NSImage *)image {
    
    NSData *imageData = [image TIFFRepresentation];
    CGImageRef imageRef = NULL;
    
    if(imageData) {
        CGImageSourceRef imageSource = CGImageSourceCreateWithData((CFDataRef)imageData, NULL);
        
        imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
    }
    return imageRef;
}

-(CGImageRef)rBlurredImage : (NSImage *)inImage : (float) blurRadius {
    CIContext *context = [CIContext contextWithOptions:nil];
    
    NSData *imageData = [inImage TIFFRepresentation];
    
    CIImage *inputImage = [[CIImage alloc] initWithData:imageData];
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:inputImage forKey:kCIInputImageKey];
    [blurFilter setValue:[NSNumber numberWithFloat:blurRadius] forKey:@"inputRadius"];
    
    CIImage *result = [blurFilter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    //CGImageRelease(cgImage);
    
    return cgImage;
}


@end
