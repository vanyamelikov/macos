//
//  ImageUtils.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//
#import "ImageUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation ImageUtils

+ (NSImage *)imageTintedWithColor:(NSColor *)tint : (NSImage *)imageToRedraw
{
    NSImage *image = [imageToRedraw copy];
    if (tint) {
        [image lockFocus];
        [tint set];
        NSRect imageRect = {NSZeroPoint, [image size]};
        NSRectFillUsingOperation(imageRect, NSCompositingOperationSourceAtop);
        [image unlockFocus];
    }
    return image;
}

+ (NSImage *)imageRepresentation :(NSView *)viewToImage
{
    BOOL wasHidden = viewToImage.isHidden;
    CGFloat wantedLayer = viewToImage.wantsLayer;
    
    viewToImage.hidden = NO;
    viewToImage.wantsLayer = YES;
    
    NSImage *image = [[NSImage alloc] initWithSize:viewToImage.bounds.size];
    [image lockFocus];
    CGContextRef ctx = [NSGraphicsContext currentContext].graphicsPort;
    [viewToImage.layer renderInContext:ctx];
    [image unlockFocus];
    
    viewToImage.wantsLayer = wantedLayer;
    viewToImage.hidden = wasHidden;
    
    return image;
}

+ (NSImage *)resizedImage:(NSImage *)sourceImage toPixelDimensions:(NSSize)newSize
{
    if (! sourceImage.isValid) return nil;
    
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc]
                             initWithBitmapDataPlanes:NULL
                             pixelsWide:newSize.width
                             pixelsHigh:newSize.height
                             bitsPerSample:8
                             samplesPerPixel:4
                             hasAlpha:YES
                             isPlanar:NO
                             colorSpaceName:NSCalibratedRGBColorSpace
                             bytesPerRow:0
                             bitsPerPixel:0];
    rep.size = newSize;
    
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext:[NSGraphicsContext graphicsContextWithBitmapImageRep:rep]];
    [sourceImage drawInRect:NSMakeRect(0, 0, newSize.width, newSize.height) fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
    [NSGraphicsContext restoreGraphicsState];
    
    NSImage *newImage = [[NSImage alloc] initWithSize:newSize];
    [newImage addRepresentation:rep];
    return newImage;
}

+(NSImage*) resize:(NSImage*)aImage frame:(NSRect)frame
{
    NSImageView* kView = [[NSImageView alloc] initWithFrame:frame];
    [kView setImageScaling:NSImageScaleAxesIndependently];
    [kView setImage:aImage];
    
    NSRect kRect = kView.frame;
    NSBitmapImageRep* kRep = [kView bitmapImageRepForCachingDisplayInRect:kRect];
    [kView cacheDisplayInRect:kRect toBitmapImageRep:kRep];
    
    NSData* kData = [kRep representationUsingType:NSJPEGFileType properties:nil];
    return [[NSImage alloc] initWithData:kData];
}

@end
