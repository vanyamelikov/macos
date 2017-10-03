//
//  NSSplitViewController+ReplaceView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 30.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface NSSplitView(ReplaceView)
-(void)replaceSplitViewItemAtIndex:(NSInteger)index withViewController:(NSView*)newView;
@end
