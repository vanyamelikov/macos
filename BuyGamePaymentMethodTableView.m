//
//  BuyGamePaymentMethodTableView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "BuyGamePaymentMethodTableView.h"
#import "PaymentInformationGameCell.h"
#import "PaymentInfoModel.h"

@implementation BuyGamePaymentMethodTableView
{
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
    
    PaymentInfoModel *model = [[PaymentInfoModel alloc] init];
    model.title = @"Dirt Rally";
    model.price = @"$4,99";
    model.gameImage = [NSImage imageNamed:@"img_store_game_list_7"];
    [dataSourceArray addObject:model];
    
    PaymentInfoModel *model1 = [[PaymentInfoModel alloc] init];
    model1.title = @"The Crew";
    model1.price = @"$16,99";
    model1.gameImage = [NSImage imageNamed:@"img_store_game_list_3"];
    [dataSourceArray addObject:model1];
    
    PaymentInfoModel *model2 = [[PaymentInfoModel alloc] init];
    model2.title = @"Assassin's Creed Syndicate";
    model2.price = @"$4,50";
    model2.gameImage = [NSImage imageNamed:@"img_store_game_list_6"];
    [dataSourceArray addObject:model2];
    
    PaymentInfoModel *model3 = [[PaymentInfoModel alloc] init];
    model3.title = @"Crysis 2";
    model3.price = @"$4,50";
    model3.gameImage = [NSImage imageNamed:@"img_store_game_list_5"];
    [dataSourceArray addObject:model3];
    
    PaymentInfoModel *model4 = [[PaymentInfoModel alloc] init];
    model4.title = @"The Crew";
    model4.price = @"$16,99";
    model4.gameImage = [NSImage imageNamed:@"img_store_game_list_3"];
    [dataSourceArray addObject:model4];
    
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

        return 105;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    PaymentInfoModel *model = [dataSourceArray objectAtIndex:row];
    PaymentInformationGameCell *cell = (PaymentInformationGameCell *)[tableView makeViewWithIdentifier:@"PaymentInformationGameCell" owner:self];
    cell.gameNameLabel.stringValue = model.title;
    cell.gameImage.image = model.gameImage;
    cell.priceLabel.stringValue = model.price;
    return cell;

}

@end
