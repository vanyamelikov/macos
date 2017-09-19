//
//  CustomTableCellView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CustomTableCellView : NSTableCellView

@property (strong) IBOutlet NSImageView *lightLayer;
@property (strong) IBOutlet NSTextField *label;

@end
