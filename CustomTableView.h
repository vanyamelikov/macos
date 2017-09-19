//
//  CustomTableView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 18.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface CustomTableView : NSTableView{
    NSColor *RGBcolor;
    NSColor *alphaColor;
}

@property (strong) IBOutlet NSBox *backgroundBox;

@end
