//
//  TextFieldWithFriend.h
//  XenioUIKit
//
//  Created by Сергей Иванов on 20.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//
#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"
#import "Colours.h"

IB_DESIGNABLE
@interface TextFieldWithFriend : INSNibLoadedView

@property (strong, nonatomic) IBInspectable NSImage *leftImage;
@property (nonatomic) IBInspectable CGSize leftImageSize;
@property (nonatomic) IBInspectable CGPoint leftImageMargin;

@property (strong, nonatomic) IBInspectable NSImage *rightImage;
@property (nonatomic) IBInspectable CGSize rightImageSize;
@property (nonatomic) IBInspectable CGPoint rightImageMargin;

@property (nonatomic) IBInspectable BOOL showRightSide;
@property (nonatomic) IBInspectable CGFloat rightSideWidth;

@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable NSColor *borderColor;

@property (nonatomic) IBInspectable NSString *placeholder;

@property (nonatomic) NSTextField *textField;

@property (nonatomic) IBInspectable CGPoint textFieldMargin;
@property (nonatomic) IBInspectable CGSize textFieldSize;

@end
