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

@end
