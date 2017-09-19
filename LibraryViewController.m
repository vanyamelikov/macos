//
//  LibraryViewController.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryViewController.h"
#import "CustomTableCellView.h"

@interface LibraryViewController (){
    NSArray *array;
    CGFloat progress;
}

@end

@implementation LibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    progress = 0.0f;
    CustomTableView * tableview = [[CustomTableView alloc] init];
    tableview.delegate = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSTimer *timer = [NSTimer timerWithTimeInterval:0.1f
                                                 target:self
                                               selector:@selector(timerFired)
                                               userInfo:nil
                                                repeats:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        });        
    });
}

-(void)timerFired {
//    if(progress < 100) {
//        [self.progressBar setProgressValue:progress];
//        progress += 5;
//    }
//    else {
//        [self.progressBar setProgressValue:100];
//        progress = 0;
//    }
//    [self.progressBar setNeedsDisplay:YES];
    srandom(time(NULL));
    int rndValue = 10 + arc4random() % (100 - 10);
    [self.mainChartView setCurrentPercent:rndValue];
    
    srandom(time(NULL));
    rndValue = 10 + arc4random() % (100 - 10);
    [self.mainChartView.lineChartView setFirstLinePercent:rndValue];
    
    srandom(time(NULL));
    rndValue = 10 + arc4random() % (100 - 10);
    [self.mainChartView.lineChartView setSecondLinePercent:rndValue];
    
    
    [self.mainChartView setNeedsDisplay:YES];

    
    
}

-(void)timerFirstLineFired {
    
}


@end
