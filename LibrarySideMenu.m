//
//  LibrarySideMenuView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibrarySideMenu.h"
#import "LibrarySideMenuCell.h"
#import "Colours.h"

@implementation LibrarySideMenu {
    NSMutableArray *dataSourceArray;
}


-(void)awakeFromNib {
    [super awakeFromNib];
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
    NSArray *titleArray = @[@"Counter Strike 1,6",
                            @"Counter Strike Condition Zero",
                            @"Crysis 2", @"Dary at Defeat",
                            @"Dead Island : Epidemic",
                            @"Deathmatch Classic",
                            @"Dota 2",
                            @"Dota 2 Test",
                            @"Kane & Leanch : Dog Days",
                            @"Mafia 2",
                            @"Medal of Honor",
                            @"Nation Red",
                            @"Ricochat"];
    dataSourceArray = [[NSMutableArray alloc] initWithArray:titleArray];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView selectRowIndexes:indexSet byExtendingSelection:NO];
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 30.0f;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    LibrarySideMenuCell *cell = (LibrarySideMenuCell *)[tableView makeViewWithIdentifier:@"LibrarySideMenuCell" owner:self];
    cell.label.stringValue = [dataSourceArray objectAtIndex:row];
    return cell;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {

}

@end














