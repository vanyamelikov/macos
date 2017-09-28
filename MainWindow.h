//
//  MainWindow.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 24.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindow : NSWindow

@property (nonatomic) NSString *backgroundImageName;

-(void)changeBackgroundImage : (NSImage *)image;

@end
