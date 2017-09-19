//
//  ChartView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"
#import "Colours.h"

@interface ChartView : INSNibLoadedView

@property (strong) IBOutlet NSBox *mainBox;
@property (strong) IBOutlet NSView *mainBoxView;
@property (strong) IBOutlet NSImageView *dotImage;

@property (nonatomic) IBInspectable CGFloat barWidth;
@property (nonatomic) IBInspectable CGFloat barMargin;

@property (nonatomic) IBInspectable CGFloat firstLineWidth;
@property (nonatomic) IBInspectable CGFloat firstLinePointsDistance;
@property (nonatomic) IBInspectable CGFloat secondLineWidth;
@property (nonatomic) IBInspectable CGFloat secondLinePointsDistance;

@property (nonatomic) IBInspectable CGFloat currentPercent;


@end
