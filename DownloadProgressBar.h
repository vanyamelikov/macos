//
//  DownloadProgressBar.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Colours.h"
#import "NSView+INSNibLoading.h"

@interface DownloadProgressBar : INSNibLoadedView


@property (strong) IBOutlet NSBox *emptyLineView;
@property (strong) IBOutlet NSBox *fillLineBox;

@property (nonatomic, readwrite) IBInspectable CGFloat progressValue;

@property (nonatomic, readwrite) IBInspectable NSString *emptyLineColor;
@property (nonatomic, readwrite) IBInspectable NSString *fillLineColor;

@property (nonatomic, readwrite) IBInspectable CGFloat emptyLineHeight;
@property (nonatomic, readwrite) IBInspectable CGFloat fillLineHeight;

@end
