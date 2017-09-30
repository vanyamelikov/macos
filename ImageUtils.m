//
//  ImageUtils.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//
#import "ImageUtils.h"

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

@end
