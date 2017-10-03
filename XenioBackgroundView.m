//
//  XenioBackgroundView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "XenioBackgroundView.h"

@implementation XenioBackgroundView

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        self.startGradientColor = [NSColor colorWithRed:(58/255) green:(55/255) blue:(102/255) alpha:1];
        self.endGradientColor = [NSColor colorWithRed:(97/255) green:(119/255) blue:(176/255) alpha:1];
        self.gradientAngle = 90.0f;
        self.gradientOpacity = 0.1f;
        
        self.blurredImage = [NSImage imageNamed:@"background_store_1"];
        self.blurRadius = 60.0f;
        self.imageTransparency = 0.04f;
        
        self.solidColor = [NSColor colorWithRed:(19/255) green:(22/255) blue:(32/255) alpha:1];
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self initView];
    }
    return self;
}

-(void)drawRect:(NSRect)dirtyRect {
    [self initView];
    //[super drawRect:dirtyRect];
}

-(void)initView {
    if(!self.startGradientColor)
        self.startGradientColor = [NSColor blueColor];
    if(!self.endGradientColor)
        self.endGradientColor = [NSColor redColor];
    if(!self.gradientAngle)
        self.gradientAngle = 90.0f;
    if(!self.gradientOpacity)
        self.gradientOpacity = 1.0f;
    
    if(!self.solidColor)
        self.solidColor = [NSColor yellowColor];
    if(!self.solidOpacity)
        self.solidOpacity = 1.0f;
    
    if(!self.imageTransparency)
        self.imageTransparency = 0.0f;
    
    if(!self.blurRadius)
        self.blurRadius = 10.0f;
    
//    [self initSolidRectangleWithColor:self.solidColor
//                           andOpacity:self.solidOpacity];
//
    if(self.blurredImage)
        [self initBlurredImageViewWithImage:self.blurredImage
                                 blurRadius:self.blurRadius
                                    opacity:self.imageTransparency];
//
//    [self initRectangleGradientWithStartColor:self.startGradientColor
//                                     endColor:self.endGradientColor
//                                gradientAngle:self.gradientAngle
//                                   andOpacity:self.gradientOpacity];
    
    [self setNeedsDisplay:YES];
}

//Set gradient layer
-(void)initRectangleGradientWithStartColor:(NSColor *)startColor
                                  endColor:(NSColor *)endColor
                             gradientAngle:(CGFloat)angle
                                andOpacity:(CGFloat)opacity {
    [self.gradientLayer setWantsLayer:YES];
    NSGradient *gradient = [[NSGradient alloc]
                            initWithStartingColor:startColor
                            endingColor:endColor];
    [gradient drawInRect:[self.gradientLayer bounds] angle:angle];
    [self.gradientLayer setAlphaValue:opacity];
    [self.gradientLayer setNeedsDisplay:YES];
}

//Set Solid Layer Background Color
-(void)initSolidRectangleWithColor:(NSColor *)color
                        andOpacity:(CGFloat)opacity {
    [self.solidLayer setWantsLayer:YES];
    [self.solidLayer setFillColor:color];
    [self.solidLayer setAlphaValue:opacity];
    [self.solidLayer setNeedsDisplay:YES];
}

//Set Blured and transparented ImageView
-(void)initBlurredImageViewWithImage:(NSImage *)image
                          blurRadius:(CGFloat)radius
                             opacity:(CGFloat)opacity {
    [self.bluredImageView setWantsLayer:YES];
    [self.bluredImageView setImage:[self gaussianBlurForImage:image
                                                     OfRadius:radius
                                                      andRect:self.bluredImageView.bounds]];
    
    [self.bluredImageView setAlphaValue:opacity];
    [self.bluredImageView setNeedsDisplay:YES];
}

//Generate Blured Image from ImageView NSImage
- (NSImage *)gaussianBlurForImage:(NSImage *)sourceImage
                         OfRadius:(CGFloat)radius
                          andRect:(NSRect)sourceRect
{
    NSImage *image = [[NSImage alloc] initWithSize:sourceRect.size];
    
    [image lockFocus];
    CIImage *beginImage = [[CIImage alloc] initWithData:[sourceImage TIFFRepresentation]];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputImageKey, beginImage, @"inputRadius", @(radius), nil];
    CIImage *output = [filter valueForKey:@"outputImage"];
    NSRect rect = NSMakeRect(0, 0, NSWidth(sourceRect), NSHeight(sourceRect));
    [output drawInRect:sourceRect fromRect:sourceRect operation:NSCompositingOperationSourceOver fraction:1.0];
    [image unlockFocus];
    
    return image;
}

@end
