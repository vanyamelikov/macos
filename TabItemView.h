//
//  TabItemView.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TabItemView;
@protocol TabItemViewDelegate <NSObject>
- (void) tabItemClicked: (NSInteger) sender;
@end

@interface TabItemView : NSBox

@property (nonatomic) IBInspectable NSInteger viewTag;
@property (nonatomic, weak) id <TabItemViewDelegate> delegate;

@end
