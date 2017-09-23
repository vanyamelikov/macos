//
//  StoreGamesView.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 22.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "StoreGamesView.h"
#import "StoreGamesViewModel.h"
#import "StoreGamesCell.h"

@implementation StoreGamesView {
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
    
    StoreGamesViewModel *model = [StoreGamesViewModel new];
    //model.title = @"RECOMMENDED";
    [dataSourceArray addObject:model];
    
    StoreGamesViewModel *model1 = [StoreGamesViewModel new];
    //model1.title = @"Featured";
    [dataSourceArray addObject:model1];
    
    StoreGamesViewModel *model2 = [StoreGamesViewModel new];
    //model2.title = @"Popular";
    [dataSourceArray addObject:model2];
    
    StoreGamesViewModel *model3 = [StoreGamesViewModel new];
    //model3.title = @"New";
    [dataSourceArray addObject:model3];
    
    StoreGamesViewModel *model4 = [StoreGamesViewModel new];
    //model4.title = @"REVIEW OF CATEGORIES";
    [dataSourceArray addObject:model4];
    
    StoreGamesViewModel *model5 = [StoreGamesViewModel new];
    //model5.title = @"Leaders Of Sells";
    [dataSourceArray addObject:model5];
    
    StoreGamesViewModel *model6 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model6];
    
    StoreGamesViewModel *model7 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model7];
    
    StoreGamesViewModel *model8 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model8];
    
    StoreGamesViewModel *model9 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model9];
    
    StoreGamesViewModel *model10 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model10];
    
    StoreGamesViewModel *model11 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model11];
    
    StoreGamesViewModel *model12 = [StoreGamesViewModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model12];
    
    StoreGamesViewModel *model13 = [StoreGamesViewModel new];
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

    return 106;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    StoreGamesViewModel *model = [dataSourceArray objectAtIndex:row];
    StoreGamesCell *cell = (StoreGamesCell *)[tableView makeViewWithIdentifier:@"StoreGamesCell" owner:self];
    //cell.gameNameLabel.stringValue = model.title;
    
    return cell;
}



@end
