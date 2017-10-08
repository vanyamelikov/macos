//
//  DownloadsViewController.m
//  XenioUIKit
//
//  Created by Иван Меликов on 05.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "DownloadsViewController.h"

@interface DownloadsViewController ()

@end

@implementation DownloadsViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self selector:@selector(randomPercentChartView:) userInfo:nil repeats:YES];
}

- (void)viewWillDisappear {
    [super viewWillDisappear];
}

- (void) randomPercentChartView:(NSTimer *)timer
{
    [self.chartView setCurrentPercent:[self randomFloatBetween:5.0f and:95.0f]];
    [self.chartView setNeedsDisplay:YES];
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

@end
