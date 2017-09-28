//
//  ImageUtils.h
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <CoreImage/CoreImage.h>

@interface ImageUtils : NSObject
+ (NSImage *)imageTintedWithColor:(NSColor *)tint : (NSImage *)imageToRedraw;
@end
