//
//  LineChartView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 19.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"
#import "Colours.h"

@interface LineChartView : INSNibLoadedView
@property (strong) IBOutlet NSBox *mainBox;
@property (strong) IBOutlet NSImageView *dotImageView;

@property (nonatomic) IBInspectable CGFloat firstLineWidth;
@property (nonatomic) IBInspectable CGFloat firstLinePointsDistance;
@property (nonatomic) IBInspectable CGFloat firstLinePercent;

@property (nonatomic) IBInspectable CGFloat secondLineWidth;
@property (nonatomic) IBInspectable CGFloat secondLinePointsDistance;
@property (nonatomic) IBInspectable CGFloat secondLinePercent;


@end
