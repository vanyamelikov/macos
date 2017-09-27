//
//  FriendsContentList.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 26.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsContentList.h"
#import "FriendsListModel.h"
#import "FriendsContentViewListCell.h"

@implementation FriendsContentList{
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
    
    FriendsListModel *model = [FriendsListModel new];
    //model.title = @"RECOMMENDED";
    [dataSourceArray addObject:model];
    
    FriendsListModel *model1 = [FriendsListModel new];
    //model1.title = @"Featured";
    [dataSourceArray addObject:model1];
    
    FriendsListModel *model2 = [FriendsListModel new];
    //model2.title = @"Popular";
    [dataSourceArray addObject:model2];
    
    FriendsListModel *model3 = [FriendsListModel new];
    //model3.title = @"New";
    [dataSourceArray addObject:model3];
    
    FriendsListModel *model4 = [FriendsListModel new];
    //model4.title = @"REVIEW OF CATEGORIES";
    [dataSourceArray addObject:model4];
    
    FriendsListModel *model5 = [FriendsListModel new];
    //model5.title = @"Leaders Of Sells";
    [dataSourceArray addObject:model5];
    
    FriendsListModel *model6 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model6];
    
    FriendsListModel *model7 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model7];
    
    FriendsListModel *model8 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model8];
    
    FriendsListModel *model9 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model9];
    
    FriendsListModel *model10 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model10];
    
    FriendsListModel *model11 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model11];
    
    FriendsListModel *model12 = [FriendsListModel new];
    //model6.title = @"Recently Updated";
    [dataSourceArray addObject:model12];
    
    FriendsListModel *model13 = [FriendsListModel new];
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
    
    return 76;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    FriendsListModel *model = [dataSourceArray objectAtIndex:row];
    FriendsContentViewListCell *cell = (FriendsContentViewListCell *)[tableView makeViewWithIdentifier:@"FriendsContentViewListCell" owner:self];
    //cell.gameNameLabel.stringValue = model.title;
    
    return cell;
}

@end
