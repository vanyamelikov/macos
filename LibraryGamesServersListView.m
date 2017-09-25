//
//  LibraryGamesServersListView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LibraryGamesServersListView.h"
#import "LibraryGamesServerListModel.h"
#import "LibraryGamesServerListCell.h"
#import "LibraryGamesServerListHeaderCell.h"

@implementation LibraryGamesServersListView {
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
    dataSourceArray = [[NSMutableArray alloc] init];
    
    LibraryGamesServerListModel *model = [LibraryGamesServerListModel new];
    model.title = @"Servers";
    model.isHeader = YES;
    [dataSourceArray addObject:model];
    
    LibraryGamesServerListModel *model1 = [LibraryGamesServerListModel new];
    model1.title = @"Sgp-1 Xenio.io";
    model1.msTitle = @"6 MS";
    model1.isHeader = NO;
    [dataSourceArray addObject:model1];
    
    LibraryGamesServerListModel *model2 = [LibraryGamesServerListModel new];
    model2.title = @"Sgp-2 Xenio.io";
    model2.msTitle = @"2 MS";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    LibraryGamesServerListModel *model3 = [LibraryGamesServerListModel new];
    model3.title = @"Syd.Xenio.io";
    model3.msTitle = @"8 MS";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    LibraryGamesServerListModel *model4 = [LibraryGamesServerListModel new];
    model4.title = @"Sgp-1 Xenio.io";
    model4.msTitle = @"7 MS";
    model4.isHeader = NO;
    [dataSourceArray addObject:model4];
    
    LibraryGamesServerListModel *model5 = [LibraryGamesServerListModel new];
    model5.title = @"Sgp-2 Xenio.io";
    model5.msTitle = @"22 MS";
    model5.isHeader = NO;
    [dataSourceArray addObject:model5];
    
    LibraryGamesServerListModel *model6 = [LibraryGamesServerListModel new];
    model6.title = @"Syd.Xenio.io";
    model6.msTitle = @"4 MS";
    model6.isHeader = NO;
    [dataSourceArray addObject:model6];
    
    LibraryGamesServerListModel *model7 = [LibraryGamesServerListModel new];
    model7.title = @"Sto.Xenio.io";
    model7.msTitle = @"62 MS";
    model7.isHeader = NO;
    [dataSourceArray addObject:model7];
    
    LibraryGamesServerListModel *model8 = [LibraryGamesServerListModel new];
    model8.title = @"Msk.Xenio.io";
    model8.msTitle = @"48 MS";
    model8.isHeader = NO;
    [dataSourceArray addObject:model8];
    
    LibraryGamesServerListModel *model9 = [LibraryGamesServerListModel new];
    model9.title = @"Vie.Xenio.io";
    model9.msTitle = @"31 MS";
    model9.isHeader = NO;
    [dataSourceArray addObject:model9];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
    [self.tableView setUsesAlternatingRowBackgroundColors:NO];
    [self.tableView setBackgroundColor:[NSColor clearColor]];
    [[self.tableView enclosingScrollView] setDrawsBackground:NO];
    
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    LibraryGamesServerListModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader)
        return 60;
    else
        return 50;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    LibraryGamesServerListModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader) {
        LibraryGamesServerListHeaderCell *cell = (LibraryGamesServerListHeaderCell *)[tableView makeViewWithIdentifier:@"LibraryGamesServerListHeaderCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }else {
        LibraryGamesServerListCell *cell = (LibraryGamesServerListCell *)[tableView makeViewWithIdentifier:@"LibraryGamesServerListCell" owner:self];
        cell.label.stringValue = model.title;
        cell.msLabel.stringValue = model.msTitle;
        return cell;
    }
}

@end
