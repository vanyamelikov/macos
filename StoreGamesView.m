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
    

//game4:
//game5:
//game6:
//game7:
//game8:
    
    dataSourceArray = [[NSMutableArray alloc] init];
    
    StoreGamesViewModel *model1 = [StoreGamesViewModel new];
    model1.gameName = @"The Witcher 3";
    model1.gameImage = [NSImage imageNamed:@"img_store_game_list_1"];
    model1.gameOSType = 2;
    model1.buttonType = 0;
    model1.gamePrice = @"$16.99";
    [dataSourceArray addObject:model1];
    
    StoreGamesViewModel *model2 = [StoreGamesViewModel new];
    model2.gameName = @"Tom Clancy's The Devision";
    model2.gameImage = [NSImage imageNamed:@"img_store_game_list_2"];
    model2.gameOSType = 2;
    model2.buttonType = 0;
    model2.gamePrice = @"$16.99";
    [dataSourceArray addObject:model2];
    
    StoreGamesViewModel *model3 = [StoreGamesViewModel new];
    model3.gameName = @"The Crew";
    model3.gameImage = [NSImage imageNamed:@"img_store_game_list_3"];
    model3.gameOSType = 2;
    model3.buttonType = 0;
    model3.gamePrice = @"$12.00";
    [dataSourceArray addObject:model3];
    
    StoreGamesViewModel *model4 = [StoreGamesViewModel new];
    model4.gameName = @"Fallout 4";
    model4.gameImage = [NSImage imageNamed:@"img_store_game_list_4"];
    model4.gameOSType = 2;
    model4.buttonType = 0;
    model4.gamePrice = @"$16.99";
    [dataSourceArray addObject:model4];
    
    
    StoreGamesViewModel *model5 = [StoreGamesViewModel new];
    model5.gameName = @"Crysis 2";
    model5.gameImage = [NSImage imageNamed:@"img_store_game_list_5"];
    model5.gameOSType = 2;
    model5.buttonType = 0;
    model5.gamePrice = @"$14.59";
    [dataSourceArray addObject:model5];
    
    StoreGamesViewModel *model6 = [StoreGamesViewModel new];
    model6.gameName = @"Assassin's Creed Syndicate";
    model6.gameImage = [NSImage imageNamed:@"img_store_game_list_6"];
    model6.gameOSType = 2;
    model6.buttonType = 0;
    model6.gamePrice = @"$6.99";
    [dataSourceArray addObject:model6];
    
    StoreGamesViewModel *model7 = [StoreGamesViewModel new];
    model7.gameName = @"Dirt Rally";
    model7.gameImage = [NSImage imageNamed:@"img_store_game_list_7"];
    model7.gameOSType = 2;
    model7.buttonType = 0;
    model7.gamePrice = @"$16.99";
    [dataSourceArray addObject:model7];
    
    StoreGamesViewModel *model8 = [StoreGamesViewModel new];
    model8.gameName = @"Need For Speed Most Wanted 2";
    model8.gameImage = [NSImage imageNamed:@"img_store_game_list_8"];
    model8.gameOSType = 2;
    model8.buttonType = 0;
    model8.gamePrice = @"$17.99";
    [dataSourceArray addObject:model8];
    
    [self.tableView setIntercellSpacing:NSMakeSize(0, 5)];

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
        cell.macosImage.hidden = NO;
        cell.windowsImage.hidden = NO;
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
