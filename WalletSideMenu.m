//
//  WalletSideMenu.m
//  XenioUIKit
//
//  Created by Сергей Иванов on 23.09.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "WalletSideMenu.h"
#import "WalletSideMenuModel.h"
#import "LibrarySideMenuCell.h"
#import "LibraryGamesRightMenuHeaderCell.h"
#import "WalletSideMenuHeaderCell.h"
#import "Colours.h"


@implementation WalletSideMenu {
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
}

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
    dataSourceArray = [[NSMutableArray alloc] init];
    
    WalletSideMenuModel *model0 = [WalletSideMenuModel new];
    model0.title = @"WALLET";
    model0.isHeader = YES;
    [dataSourceArray addObject:model0];
    
    WalletSideMenuModel *model = [WalletSideMenuModel new];
    model.title = @"Send";
    model.isHeader = NO;
    [dataSourceArray addObject:model];
    
    WalletSideMenuModel *model1 = [WalletSideMenuModel new];
    model1.title = @"Receive";
    model1.isHeader = NO;
    [dataSourceArray addObject:model1];
    
    WalletSideMenuModel *model2 = [WalletSideMenuModel new];
    model2.title = @"History";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    WalletSideMenuModel *model3 = [WalletSideMenuModel new];
    model3.title = @"Favorites";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    WalletSideMenuModel *model4 = [WalletSideMenuModel new];
    model4.title = @"SETTINGS";
    model4.isHeader = YES;
    [dataSourceArray addObject:model4];
    
    WalletSideMenuModel *model5 = [WalletSideMenuModel new];
    model5.title = @"Password";
    model5.isHeader = NO;
    [dataSourceArray addObject:model5];
    
    WalletSideMenuModel *model6 = [WalletSideMenuModel new];
    model6.title = @"My cards";
    model6.isHeader = NO;
    [dataSourceArray addObject:model6];
    
    WalletSideMenuModel *model7 = [WalletSideMenuModel new];
    model7.title = @"Security";
    model7.isHeader = NO;
    [dataSourceArray addObject:model7];
    
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
    WalletSideMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader)
        return 40;
    else
        return 29;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    WalletSideMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader) {
        WalletSideMenuHeaderCell *cell = (WalletSideMenuHeaderCell *)[tableView makeViewWithIdentifier:@"WalletSideMenuHeaderCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }else {
        LibrarySideMenuCell *cell = (LibrarySideMenuCell *)[tableView makeViewWithIdentifier:@"LibrarySideMenuCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger index = [self.tableView selectedRow];
    WalletSideMenuModel *model = [dataSourceArray objectAtIndex:index];
    if(!model.isHeader && index != preSelectedRow) {
        LibrarySideMenuCell *cellView = (LibrarySideMenuCell *)[self.tableView viewAtColumn:0 row:index makeIfNecessary:YES];
        LibrarySideMenuCell *preSelectedCellView = (LibrarySideMenuCell *)[self.tableView viewAtColumn:0 row:preSelectedRow makeIfNecessary:YES];
        if(cellView != nil && [cellView isKindOfClass:[LibrarySideMenuCell class]])
        {
            cellView.lightLayer.hidden = NO;
            [cellView.label setTextColor:[NSColor colorFromHexString:@"#ffffff"]];
        }
        
        if(preSelectedCellView != nil && [preSelectedCellView isKindOfClass:[LibrarySideMenuCell class]])
        {
            preSelectedCellView.lightLayer.hidden = YES;
            [preSelectedCellView.label setTextColor:[NSColor colorFromHexString:@"#78819F"]];
        }
        preSelectedRow = index;
        
        [[NSNotificationCenter defaultCenter]
             postNotificationName:@"changeWalletPage"
             object:[NSString stringWithFormat:@"%ld",index]];

//        if(delegate && [self.delegate respondsToSelector:@selector(itemClicked::)]) {
//            [self.delegate itemClicked:index:model.title];
//        }
    }
}

@end
