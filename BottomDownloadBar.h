//
//  BottonDownloadBar.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 27.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "RoundButton.h"

@class BottomDownloadBar;
@protocol BottomDownloadBarDelegate <NSObject>
-(void)openDownloadsViewController;
@end

@interface BottomDownloadBar : INSNibLoadedView

@property (strong) IBOutlet RoundButton *stopButton;
@property (strong) IBOutlet NSImageView *downloadButton;
@property (strong) IBOutlet NSTextField *gameNameLabel;
@property (strong) IBOutlet NSBox *activeBar;
@property (strong) IBOutlet NSBox *backgroundBar;
@property (strong) IBOutlet NSTextField *percentLabel;
@property (strong) IBOutlet NSImageView *hideButton;

@property (nonatomic, weak) id<BottomDownloadBarDelegate> delegate;

@end
