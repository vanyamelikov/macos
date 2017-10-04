//
//  StorePurchaseListView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 03.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StorePurchaseListView.h"
#import "StoreGamesViewModel.h"
#import "StoreGameSideListCell.h"
#import "StoreGameSideListHeaderCell.h"


@implementation StorePurchaseListView

@synthesize dataSourceArray;
@synthesize delegate;

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
    NSArray *titleArray = @[@"Game",
                            @"Information",
                            @"Related products",
                            @"Reviews"];
    
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
    StoreGameSideListCell *cell = (StoreGameSideListCell *)[tableView makeViewWithIdentifier:@"StoreGameSideListCell" owner:self];
    cell.label.stringValue = [dataSourceArray objectAtIndex:row];
    return cell;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger index = [self.tableView selectedRow];
    if(delegate && [self.delegate respondsToSelector:@selector(itemClicked:)])
    {
        [self.delegate itemClicked:index];
    }
}

@end

