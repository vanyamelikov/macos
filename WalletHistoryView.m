//
//  WalletHistoryView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 23.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletHistoryView.h"
#import "WalletHistoryModel.h"
#import "WalletHistoryCell.h"

@implementation WalletHistoryView {
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
    
    WalletHistoryModel *model = [WalletHistoryModel new];
    model.title = @"Servers";
    [dataSourceArray addObject:model];
    
    WalletHistoryModel *model1 = [WalletHistoryModel new];
    model1.title = @"Sgp-1 Xenio.io";
    [dataSourceArray addObject:model1];
    
    WalletHistoryModel *model2 = [WalletHistoryModel new];
    model2.title = @"Sgp-2 Xenio.io";
    [dataSourceArray addObject:model2];
    
    WalletHistoryModel *model3 = [WalletHistoryModel new];
    model3.title = @"Syd.Xenio.io";
    [dataSourceArray addObject:model3];
    
    WalletHistoryModel *model4 = [WalletHistoryModel new];
    model4.title = @"Sgp-1 Xenio.io";
    [dataSourceArray addObject:model4];
    
    WalletHistoryModel *model5 = [WalletHistoryModel new];
    model5.title = @"Sgp-2 Xenio.io";
    [dataSourceArray addObject:model5];
    
    WalletHistoryModel *model6 = [WalletHistoryModel new];
    [dataSourceArray addObject:model6];
    
    WalletHistoryModel *model7 = [WalletHistoryModel new];
    model7.title = @"Sto.Xenio.io";
    [dataSourceArray addObject:model7];
    
    WalletHistoryModel *model8 = [WalletHistoryModel new];
    model8.title = @"Msk.Xenio.io";
    [dataSourceArray addObject:model8];
    
    WalletHistoryModel *model9 = [WalletHistoryModel new];
    model9.title = @"Vie.Xenio.io";
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
    
    return 103;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    WalletHistoryModel *model = [dataSourceArray objectAtIndex:row];
    WalletHistoryCell *cell = (WalletHistoryCell *)[tableView makeViewWithIdentifier:@"WalletHistoryCell" owner:self];
        
    return cell;
}

@end
