//
//  LastActivityView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "LastActivityView.h"
#import "LastActivityCell.h"
#import "ProfileModel.h"

@implementation LastActivityView {
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
    
    ProfileModel *model = [[ProfileModel alloc] init];
    model.title = @"Adventures of burger";
    model.lastActivityTime = @"2h ago";
    model.totalTime = @"2.321 Hours";
    model.gameImage = [NSImage imageNamed:@"activity_image_1"];
    [dataSourceArray addObject:model];
    
    ProfileModel *model1 = [[ProfileModel alloc] init];
    model1.title = @"Watch out for snipers";
    model1.lastActivityTime = @"6h ago";
    model1.totalTime = @"960 Hours";
    model1.gameImage = [NSImage imageNamed:@"activity_image_2"];
    [dataSourceArray addObject:model1];
    
    ProfileModel *model2 = [[ProfileModel alloc] init];
    model2.title = @"Brotherhood of light";
    model2.lastActivityTime = @"8h ago";
    model2.totalTime = @"650 Hours";
    model2.gameImage = [NSImage imageNamed:@"activity_image_3"];
    [dataSourceArray addObject:model2];
    
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
    ProfileModel *model = [dataSourceArray objectAtIndex:row];
    LastActivityCell *cell = (LastActivityCell *)[tableView makeViewWithIdentifier:@"LastActivityCell" owner:self];
    cell.activityNameLabel.stringValue = model.title;
    cell.lastActivityTime.stringValue = model.lastActivityTime;
    cell.totalTimeLabel.stringValue = model.totalTime;
    cell.image.image = model.gameImage;
    return cell;
    
}

@end
