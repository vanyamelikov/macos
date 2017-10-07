//
//  BottonDownloadBar.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 27.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BottomDownloadBar.h"

@implementation BottomDownloadBar

@synthesize delegate;

- (IBAction)openDownloadsPage:(NSClickGestureRecognizer *)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(openDownloadsViewController)]) {
        [self.delegate openDownloadsViewController];
    }
}


@end
