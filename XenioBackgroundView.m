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
    [self addSolidRectangleWithColor:self.solidColor
                          andOpacity:self.solidOpacity];
    [super drawRect:dirtyRect];
}

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
    [solidLayer setBackgroundColor:[NSColor redColor].CGColor];
    
    [self.layer addSublayer:solidLayer];
}

//Set Blured and transparented ImageView
-(void)addBlurredImageViewWithImage:(NSImage *)image
                          blurRadius:(CGFloat)radius
                             opacity:(CGFloat)opacity {
}

//Set gradient layer
-(void)addRectangleGradientWithStartColor:(NSColor *)startColor
                                 endColor:(NSColor *)endColor
                            gradientAngle:(CGFloat)angle
                               andOpacity:(CGFloat)opacity {
    
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

//Create Core Image Filter
-(NSArray *)filters {
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    [blurFilter setValue:[NSNumber numberWithFloat:0.0]
                  forKey:@"inputRadius"];
    [blurFilter setName:@"blur"];
    return [NSArray arrayWithObjects:blurFilter, nil];
}


@end
