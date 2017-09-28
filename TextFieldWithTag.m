//
//  TextFieldWithTag.m
//  XenioUIKit
//
//  Created by Иван Меликов on 28.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "TextFieldWithTag.h"

@implementation TextFieldWithTag

@synthesize tagDelegate;


-(BOOL)becomeFirstResponder {
    if(tagDelegate && [self.tagDelegate respondsToSelector:@selector(textFieldSelected:)]) {
        [self.tagDelegate textFieldSelected:self];
    }
    return YES;
}

@end
