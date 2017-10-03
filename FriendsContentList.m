
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
    model.friendName = @"Alexander F";
    model.friendGame = @"The Crew";
    model.friendImage = @"img_friend_1";
    model.playerStatus = 0;
    [dataSourceArray addObject:model];
    
    FriendsListModel *model1 = [FriendsListModel new];
    model1.friendName = @"GoodGame D";
    model1.friendGame = @"Counter-Strike 1.6";
    model1.friendImage = @"img_friend_2";
    model1.playerStatus = 1;
    [dataSourceArray addObject:model1];
    
    FriendsListModel *model2 = [FriendsListModel new];
    model2.friendName = @"Mooooooooon n1";
    model2.friendGame = @"Dota 2";
    model2.friendImage = @"img_friend_3";
    model2.playerStatus = 2;
    [dataSourceArray addObject:model2];
    
    FriendsListModel *model3 = [FriendsListModel new];
    model3.friendName = @"ZnaG1";
    model3.friendGame = @"Counter-Strike 1.6";
    model3.friendImage = @"img_friend_4";
    model3.playerStatus = 3;
    [dataSourceArray addObject:model3];
    
    FriendsListModel *model4 = [FriendsListModel new];
    model4.friendName = @"Aizerbergen";
    model4.friendGame = @"Dota 2";
    model4.friendImage = @"img_friend_5";
    model4.playerStatus = 4;
    [dataSourceArray addObject:model4];
    
    FriendsListModel *model5 = [FriendsListModel new];
    model5.friendName = @"SySoYeviCH";
    model5.friendGame = @"GTA 5";
    model5.friendImage = @"img_friend_6";
    model5.playerStatus = 3;
    [dataSourceArray addObject:model5];
    
    [self.tableView setIntercellSpacing:CGSizeMake(0.0f, 5.0f)];
    
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
    FriendsListModel *model = [dataSourceArray objectAtIndex:row];
    FriendsContentViewListCell *cell = (FriendsContentViewListCell *)[tableView makeViewWithIdentifier:@"FriendsContentListViewCell" owner:self];
    [cell.playerImage setImage:[NSImage imageNamed: model.friendImage]];
    [cell.playerNameLabel setStringValue:model.friendName];
    [cell.gameNameLabel setStringValue:model.friendGame];
    switch (model.playerStatus) {
        case 0:
            cell.status0.hidden = NO;
            break;
        case 1:
            cell.status1.hidden = NO;
            break;
        case 2:
            cell.status2.hidden = NO;
            break;
        case 3:
            cell.status3.hidden = NO;
            break;
        case 4:
            cell.status4.hidden = NO;
            break;
        default:
            break;
    }
    return cell;
}

@end
