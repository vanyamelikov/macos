//
//  LibraryViewController.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CustomTableView.h"
#import "DownloadProgressBar.h"
#import "ChartView.h"

@interface LibraryViewController : NSViewController <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet CustomTableView *customTableView;
@property (strong) IBOutlet DownloadProgressBar *progressBar;
@property (strong) IBOutlet ChartView *mainChartView;

@end
