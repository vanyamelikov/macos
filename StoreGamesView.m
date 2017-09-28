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
#import "LLIButton.h"
#import "FreeButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation StoreGamesView {
    NSMutableArray *dataSourceArray;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
    [self.tableView setUsesAlternatingRowBackgroundColors:NO];
    [self.tableView setBackgroundColor:[NSColor clearColor]];
    [[self.tableView enclosingScrollView] setDrawsBackground:NO];
    [self.tableView.enclosingScrollView.contentView setCopiesOnScroll:NO];
    self.tableView.enclosingScrollView.wantsLayer = YES;
    self.tableView.wantsLayer = YES;
    [self.tableView.enclosingScrollView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawNever];
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
    model.gameName = @"Crysis 2";
    model.gameImage = [NSImage imageNamed:@"screenshot"];
    model.gameOSType = 1;
    model.buttonType = 0;
    model.gamePrice = @"$16.99";
    for(int i = 0; i < 10; i ++) {
        [dataSourceArray addObject:model];
    }

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    cell.gameNameLabel.stringValue = model.gameName;
    cell.gameImage.image = model.gameImage;
    if(model.gameOSType == 0) {
        cell.macosImage.hidden = YES;
        cell.windowsImage.hidden = NO;
    } else if(model.gameOSType == 1) {
        cell.macosImage.hidden = NO;
        cell.windowsImage.hidden = YES;
    } else {
        cell.macosImage.hidden = YES;
        cell.windowsImage.hidden = YES;
    }
    cell.priceLabel.stringValue = model.gamePrice;
    if(model.buttonType == 0) {
        cell.preOrderButton.hidden = NO;
        cell.freeButton.hidden = YES;
    } else if(model.buttonType == 1) {
        cell.preOrderButton.hidden = YES;
        cell.freeButton.hidden = NO;
    }
    return cell;
}



@end
