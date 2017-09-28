//
//  TextFieldWithFriend.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 20.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "TextFieldWithFriend.h"

@implementation TextFieldWithFriend {
    NSBezierPath *borderPath;
    NSBezierPath *dividerPath;
    NSImageView *rightImageView;
    NSImageView *leftImageView;
}

@synthesize borderWidth;
@synthesize cornerRadius;
@synthesize borderColor;
@synthesize rightSideWidth;
@synthesize leftImageSize, rightImageSize;
@synthesize textField;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self initView];
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        [self initView];
    }
    return self;
}

-(void)initView {
    //init first params
    if(borderWidth == 0)
        borderWidth = 2.0f;
    if(cornerRadius == 0)
        cornerRadius = 4.0f;
    if(rightSideWidth == 0)
        rightSideWidth = 38.0f;
    if(leftImageSize.width == 0 && leftImageSize.height == 0)
        leftImageSize = CGSizeMake(12, 12);
    if(rightImageSize.width == 0 && rightImageSize.height == 0)
        rightImageSize = CGSizeMake(15, 15);
    
    if(self.leftImageMargin.x == 0 && self.leftImageMargin.y == 0)
        self.leftImageMargin = CGPointMake(16, 16);
    if(self.rightImageMargin.x == 0 && self.rightImageMargin.y == 0)
        self.rightImageMargin = CGPointMake(4, 4);
    
    [self drawTextField];
}

-(void)drawTextField {
    if(!borderColor)
        borderColor = [NSColor colorFromHexString:@"#cccccc"];
    else
        borderColor = [NSColor colorFromHexString:@"#cccccc"];
    
    //draw main border
    borderPath = [[NSBezierPath alloc] init];
    [borderColor set];
    borderPath = [NSBezierPath bezierPathWithRoundedRect:CGRectInset(self.bounds, borderWidth/2, borderWidth/2) xRadius:cornerRadius yRadius:cornerRadius];
    borderPath.lineWidth = borderWidth;
    [borderPath stroke];
    [borderPath closePath];
    
    //Draw divider line
    if(self.showRightSide) {
        dividerPath = [[NSBezierPath alloc] init];
        [dividerPath setLineWidth:borderWidth];
        [borderColor set];
        
        NSPoint bottomPoint = CGPointMake(self.bounds.size.width - rightSideWidth - borderWidth, self.bounds.origin.y);
        NSPoint topPoint = CGPointMake(self.bounds.size.width - rightSideWidth - borderWidth, self.bounds.size.height);
        
        [dividerPath moveToPoint:bottomPoint];
        [dividerPath lineToPoint:topPoint];
        
        [dividerPath stroke];
        [dividerPath closePath];
        
        rightImageView = [[NSImageView alloc] initWithFrame:
                          CGRectMake(
                                     self.bounds.size.width - rightImageSize.width - self.rightImageMargin.x,
                                     self.bounds.size.height - rightImageSize.height - self.rightImageMargin.y,
                                     rightImageSize.width,
                                     rightImageSize.height
                                     )];
        [rightImageView setImage:self.rightImage];
        [rightImageView setImageScaling:NSImageScaleAxesIndependently];
        
        [self addSubview:rightImageView];
        
        textField = [[NSTextField alloc] initWithFrame:CGRectMake(
                                                                  borderWidth + self.leftImageMargin.x + self.textFieldMargin.x,
                                                                  (self.bounds.size.height - self.textFieldSize.height)/2,
                                                                  self.bounds.size.width
                                                                  - 2*self.leftImageMargin.x
                                                                  - self.leftImageSize.width
                                                                  - 2*self.rightImageMargin.x
                                                                  - self.rightImageSize.width
                                                                  - 2*self.textFieldMargin.x,
                                                                  self.textFieldSize.height
                                                                  )];
    } else {
        textField = [[NSTextField alloc] initWithFrame:CGRectMake(
                                                                  borderWidth + self.leftImageMargin.x + self.textFieldMargin.x,
                                                                  (self.bounds.size.height - self.textFieldSize.height)/2,
                                                                  self.bounds.size.width
                                                                  - 2*self.leftImageMargin.x
                                                                  - self.leftImageSize.width
                                                                  - 2*self.textFieldMargin.x,
                                                                  self.textFieldSize.height
                                                                  )];
    }
    
    leftImageView = [[NSImageView alloc] initWithFrame:CGRectMake(
                                                                  self.leftImageMargin.x,
                                                                  self.leftImageMargin.y,
                                                                  leftImageSize.width,
                                                                  leftImageSize.height
                                                                  )];
    [leftImageView setImage:self.leftImage];
    [leftImageView setImageScaling:NSImageScaleAxesIndependently];
    
    [self addSubview:leftImageView];
    
    
    [textField setBordered:NO];
    [textField setBackgroundColor:[NSColor redColor]];
    [textField setTextColor:[NSColor whiteColor]];
    [textField setPlaceholderString:self.placeholder];
    [textField setMaximumNumberOfLines:1];
    [textField setBordered:NO];
    [textField setFont:[NSFont fontWithName:@"SF UI  Text" size:12.0f]];
    [textField setFocusRingType:NSFocusRingTypeNone];
    [textField setLineBreakMode:NSLineBreakByTruncatingTail];
    
    [self addSubview:textField];
    
    [textField setNeedsDisplay:YES];
    
    [self setNeedsDisplay:YES];
}


@end
