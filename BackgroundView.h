//
//  BackgroundView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 01.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BackgroundView : NSView

@property (nonatomic) NSImage * nsImageObj;
-(void)addImage:(NSImage *)pImage;

@end
