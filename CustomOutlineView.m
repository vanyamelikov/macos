//
//  CustomOutlineView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 02.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomOutlineView.h"

@implementation CustomOutlineView

- (id)makeViewWithIdentifier:(NSString *)identifier owner:(id)owner {
    id view = [super makeViewWithIdentifier:identifier owner:owner];
    
    if ([identifier isEqualToString:NSOutlineViewDisclosureButtonKey]) {
        return nil;
    }
    
    return view;
}

@end
