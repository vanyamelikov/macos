//
//  CustomTableCellView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 16.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomTableCellView.h"

@implementation CustomTableCellView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    CustomTableCellView *cellView = [tableView makeViewWithIdentifier:@"customTableCellView" owner:self];
    cellView.textField.textColor = [NSColor whiteColor];
    
    return cellView;
}

@end
