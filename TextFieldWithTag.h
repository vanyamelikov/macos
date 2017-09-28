//
//  TextFieldWithTag.h
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class TextFieldWithTag;
@protocol TextFieldWithTagDelegate <NSObject>
- (void) textFieldSelected: (NSTextField *) sender;
@end

@interface TextFieldWithTag : NSTextField
@property (nonatomic) IBInspectable NSInteger mTag;
@property (nonatomic, weak) id <TextFieldWithTagDelegate> tagDelegate;
@end
