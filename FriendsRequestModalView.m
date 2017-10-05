//
//  FriendsRequestModalView.m
//  XenioUIKit
//
//  Created by Иван Меликов on 04.10.17.
//  Copyright © 2017 mifsoftware. All rights reserved.
//

#import "FriendsRequestModalView.h"
#import "FriendsListModel.h"
#import "FriendsChatRequestCell.h"

@implementation FriendsRequestModalView {
    NSMutableArray *dataSourceArray;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self setWantsLayer:YES];
    [self.layer setCornerRadius:5.0f];
    [self.layer setMasksToBounds:YES];
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(NSRect)frameRect {
    self = [super initWithFrame:frameRect];
    if(self) {
        
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

-(void)initView {
    dataSourceArray = [[NSMutableArray alloc] init];
    
    FriendsListModel *model0 = [FriendsListModel new];
    model0.friendName = @"";
    model0.friendStatus = @"";
    model0.friendImage = @"img_friend_1";
    [dataSourceArray addObject:model0];
    
    FriendsListModel *model1 = [FriendsListModel new];
    model1.friendName = @"";
    model1.friendStatus = @"";
    model1.friendImage = @"img_friend_2";
    [dataSourceArray addObject:model1];
    
    FriendsListModel *model2 = [FriendsListModel new];
    model2.friendName = @"";
    model2.friendStatus = @"";
    model2.friendImage = @"img_friend_3";
    [dataSourceArray addObject:model2];
    
    FriendsListModel *model3 = [FriendsListModel new];
    model3.friendName = @"";
    model3.friendStatus = @"";
    model3.friendImage = @"img_friend_4";
    [dataSourceArray addObject:model3];
    
    FriendsListModel *model4 = [FriendsListModel new];
    model4.friendName = @"";
    model4.friendStatus = @"";
    model4.friendImage = @"img_friend_5";
    [dataSourceArray addObject:model4];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 66;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    FriendsListModel *model = [dataSourceArray objectAtIndex:row];
    FriendsChatRequestCell *cell = (FriendsChatRequestCell *)[tableView makeViewWithIdentifier:@"FriendsChatRequestCell" owner:self];
    [cell.playerNameLabel setStringValue:model.friendName];
    [cell.playerStatusLabel setStringValue:model.friendStatus];
    [cell.playerImage setImage:[NSImage imageNamed:model.friendImage]];
    return cell;
    
}

@end
