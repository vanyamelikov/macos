//
//  ChatDialogsView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 08.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "ChatDialogsView.h"

@implementation ChatDialogsView {
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
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
    
    ChatDialogModel *model1 = [ChatDialogModel new];
    model1.dialogImage = @"ic_dialog_1";
    model1.dialogName = @"kneder1a";
    model1.dialogStatus = @"In Game";
    [dataSourceArray addObject:model1];
    
    ChatDialogModel *model2 = [ChatDialogModel new];
    model2.dialogImage = @"ic_dialog_2";
    model2.dialogName = @"Panica";
    model2.dialogStatus = @"In Game";
    [dataSourceArray addObject:model2];
    
    ChatDialogModel *model3 = [ChatDialogModel new];
    model3.dialogImage = @"ic_dialog_3";
    model3.dialogName = @"prod. Calibree";
    model3.dialogStatus = @"In Game";
    [dataSourceArray addObject:model3];
    
    ChatDialogModel *model4 = [ChatDialogModel new];
    model4.dialogImage = @"ic_dialog_4";
    model4.dialogName = @"Merzlota 1";
    model4.dialogStatus = @"In Game";
    [dataSourceArray addObject:model4];
    
    ChatDialogModel *model5 = [ChatDialogModel new];
    model5.dialogImage = @"ic_dialog_5";
    model5.dialogName = @"Ralf";
    model5.dialogStatus = @"In Game";
    [dataSourceArray addObject:model5];
    
    ChatDialogModel *model6 = [ChatDialogModel new];
    model6.dialogImage = @"ic_dialog_6";
    model6.dialogName = @"Fast mar1o";
    model6.dialogStatus = @"In Game";
    [dataSourceArray addObject:model6];
    
    ChatDialogModel *model7 = [ChatDialogModel new];
    model7.dialogImage = @"ic_dialog_7";
    model7.dialogName = @"aeiks0";
    model7.dialogStatus = @"In Game";
    [dataSourceArray addObject:model7];
    
    [self.tableView setIntercellSpacing:NSZeroSize];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];

    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView selectRowIndexes:indexSet byExtendingSelection:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}


#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 46.0f;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    ChatDialogModel *model = (ChatDialogModel *)[dataSourceArray objectAtIndex:row];
    ChatDialogItem *cell = (ChatDialogItem *)[tableView makeViewWithIdentifier:@"ChatDialogItem" owner:self];
    [cell.dialogAvatarIV setImage:[NSImage imageNamed:model.dialogImage]];
    [cell.dialogNameLabel setStringValue:model.dialogName];
    [cell.dialogStatusLabel setStringValue:model.dialogStatus];
    return cell;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger index = [self.tableView selectedRow];
    ChatDialogModel *model = [dataSourceArray objectAtIndex:index];
    if(index != preSelectedRow) {
        ChatDialogItem *cellView = (ChatDialogItem *)[self.tableView viewAtColumn:0 row:index makeIfNecessary:YES];
        ChatDialogItem *preSelectedCellView = (ChatDialogItem *)[self.tableView viewAtColumn:0 row:preSelectedRow makeIfNecessary:YES];
        if(cellView != nil && [cellView isKindOfClass:[ChatDialogItem class]])
        {
            cellView.dialogLightLayer.hidden = NO;
        }
        
        if(preSelectedCellView != nil && [preSelectedCellView isKindOfClass:[ChatDialogItem class]])
        {
            preSelectedCellView.dialogLightLayer.hidden = YES;
        }
        preSelectedRow = index;
    }
}

@end
