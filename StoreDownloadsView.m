//
//  StoreDownloadsView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 23.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreDownloadsView.h"
#import "StoreDownloadsModel.h"
#import "StoreDownloadsCell.h"

@implementation StoreDownloadsView {
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
    
    StoreDownloadsModel *model1 = [StoreDownloadsModel new];
    //model1.title = @"Featured";
    [dataSourceArray addObject:model1];
    
    StoreDownloadsModel *model2 = [StoreDownloadsModel new];
    //model2.title = @"Popular";
    [dataSourceArray addObject:model2];
    
    StoreDownloadsModel *model3 = [StoreDownloadsModel new];
    //model3.title = @"New";
    [dataSourceArray addObject:model3];
    
    StoreDownloadsModel *model4 = [StoreDownloadsModel new];
    //model4.title = @"REVIEW OF CATEGORIES";
    [dataSourceArray addObject:model4];
    
    StoreDownloadsModel *model5 = [StoreDownloadsModel new];
    //model5.title = @"Leaders Of Sells";
    [dataSourceArray addObject:model5];
    
    StoreDownloadsModel *model6 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model6];
    
    StoreDownloadsModel *model7 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model7];
    
    StoreDownloadsModel *model8 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model8];
    
    StoreDownloadsModel *model9 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model9];
    
    StoreDownloadsModel *model10 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model10];
    
    StoreDownloadsModel *model11 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model11];
    
    StoreDownloadsModel *model12 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model12];
    
    StoreDownloadsModel *model13 = [StoreDownloadsModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model13];
    
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
    
    return 61;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    //StoreDownloadsModel *model = [dataSourceArray objectAtIndex:row];
    StoreDownloadsCell *cell = (StoreDownloadsCell *)[tableView makeViewWithIdentifier:@"StoreGamesCell" owner:self];
    //cell.gameNameLabel.stringValue = model.title;
    
    return cell;
}

@end
