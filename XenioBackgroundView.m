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

@implementation XenioBackgroundView

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
//    [self addSolidRectangleWithColor:self.solidColor
//                          andOpacity:self.solidOpacity];
//    [self addRectangleGradientWithStartColor:self.startGradientColor
//                                    endColor:self.endGradientColor
//                                  andOpacity:self.gradientOpacity];
//    [self addBlurredImageViewWithImage:[NSImage imageNamed:@"background_store_1"]
//                            blurRadius:60.0f
//                               opacity:1.0f];
    [self addBlurredImageViewWithImage:[NSImage imageNamed:@"background_store_1"]
                            blurRadius:60.0f
                               opacity:1.0f];
}

//-(void)awakeFromNib {
//    [self addBlurredImageViewWithImage:[NSImage imageNamed:@"background_store_1"]
//                            blurRadius:60.0f
//                               opacity:1.0f];
//}

-(void)initView {
    if(!self.startGradientColor)
        self.startGradientColor = [NSColor blueColor];
    if(!self.endGradientColor)
        self.endGradientColor = [NSColor redColor];
    if(!self.gradientAngle)
        self.gradientAngle = 90.0f;
    if(!self.gradientOpacity)
        self.gradientOpacity = .1f;
    
    if(!self.solidColor)
        self.solidColor = [NSColor yellowColor];
    if(!self.solidOpacity)
        self.solidOpacity = 1.0f;
    
    if(!self.imageTransparency)
        self.imageTransparency = 1.0f;
    
    if(!self.blurRadius)
        self.blurRadius = 60.0f;
    
}


//Set Solid Layer Background Color
-(void)addSolidRectangleWithColor:(NSColor *)color
                        andOpacity:(CGFloat)opacity {
    [self setWantsLayer:YES];
    CALayer *solidLayer = [CALayer layer];
    [solidLayer setFrame:self.frame];
    [solidLayer setCornerRadius:0.0f];
    [solidLayer setBorderWidth:0.0f];
    [solidLayer setMasksToBounds:YES];
    [solidLayer setBackgroundColor:color.CGColor];
    [solidLayer setOpacity:opacity];
    
    [self.layer addSublayer:solidLayer];
}

//Set Blured and transparented ImageView
-(void)addBlurredImageViewWithImage:(NSImage *)image
                          blurRadius:(CGFloat)radius
                             opacity:(CGFloat)opacity {
    [self setWantsLayer:YES];
    CALayer *blurredImageLayer = [CALayer layer];
    [blurredImageLayer setFrame:self.frame];
    [blurredImageLayer setMasksToBounds:YES];
    
    [blurredImageLayer setContents:(id)[self rBlurredImage:image]];
    
    [blurredImageLayer setOpacity:1.0f];
    
    [self.layer addSublayer:blurredImageLayer];
}

//Set gradient layer
-(void)addRectangleGradientWithStartColor:(NSColor *)startColor
                                 endColor:(NSColor *)endColor
                               andOpacity:(CGFloat)opacity {
    [self setWantsLayer:YES];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [gradientLayer setFrame:self.frame];
    [gradientLayer setMasksToBounds:YES];
    [gradientLayer setColors:[NSArray arrayWithObjects:
                              (id)[startColor CGColor],
                              (id)[endColor CGColor], nil]];
    [gradientLayer setOpacity:opacity];
    
    [self.layer addSublayer:gradientLayer];
}


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

-(CGImageRef)rBlurredImage : (NSImage *)inImage {
    CIContext *context = [CIContext contextWithOptions:nil];
    
    NSData *imageData = [inImage TIFFRepresentation];
    
    CIImage *inputImage = [[CIImage alloc] initWithData:imageData];
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setValue:inputImage forKey:kCIInputImageKey];
    [blurFilter setValue:@60.0f forKey:@"inputRadius"];
    
    CIImage *result = [blurFilter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    //CGImageRelease(cgImage);
    
    return cgImage;
}


@end
