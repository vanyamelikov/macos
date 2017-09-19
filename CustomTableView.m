//
//  CustomTableView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 18.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "CustomTableView.h"
#import "Colours.h"
#import "CustomTableCellView.h"

@implementation CustomTableView{
    NSArray *array;
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    
    return 5;
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
    
    return ([array objectAtIndex:row]);
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    
    CustomTableCellView *cellView = [tableView makeViewWithIdentifier:@"customTableCellView" owner:self];
    
    return cellView;
}

@end
