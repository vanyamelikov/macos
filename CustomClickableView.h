//
//  CustomClickableView.h
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "NSView+INSNibLoading.h"
#import "JMModalOverlay.h"
#import "CustomClickableView.h"

@class CustomClickableView;
@protocol CustomClickableViewDelegate <NSObject>
-(void)customClickableViewClicked;
@end

@interface CustomClickableView : INSNibLoadedView <JMModalOverlayDelegate>
@property (nonatomic, weak) id<CustomClickableViewDelegate> delegate;
@end
