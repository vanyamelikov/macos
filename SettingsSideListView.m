#import "SettingsSideListView.h"
#import "FriendsHideCell.h"
#import "FriendsRightListCell.h"
#import "FriendsListModel.h"
#import "SettingsFriendsListModel.h"
#import "FriendProfileModalViewController.h"
#import "SelfStatusModalViewController.h"

@implementation SettingsSideListView{
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
    NSPopover *popover;
    FriendProfileModalViewController *popoverViewController;
    SelfStatusModalViewController *popoverViewController1;
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
    
#pragma mark - Fill Online Data
    NSMutableArray<FriendsListModel *> *group1 = [[NSMutableArray<FriendsListModel *> alloc] init];
    
    FriendsListModel *friend01 = [FriendsListModel new];
    friend01.friendImage = @"general_image_1";
    friend01.friendName = @"kneder1a";
    friend01.friendStatus = @"In Game";
    friend01.friendGame = @"Dota 2";
    [group1 addObject:friend01];
    
    FriendsListModel *friend02 = [FriendsListModel new];
    friend02.friendImage = @"general_image_2";
    friend02.friendName = @"Panica";
    friend02.friendStatus = @"In Game";
    friend02.friendGame = @"Counter-Strike GO";
    [group1 addObject:friend02];
    
    FriendsListModel *friend03 = [FriendsListModel new];
    friend03.friendImage = @"general_image_3";
    friend03.friendName = @"prod. Calibree";
    friend03.friendStatus = @"In Game";
    friend03.friendGame = @"Dota 2";
    [group1 addObject:friend03];
    
    FriendsListModel *friend04 = [FriendsListModel new];
    friend04.friendImage = @"general_image_4";
    friend04.friendName = @"Merzlota 1";
    friend04.friendStatus = @"In Game";
    friend04.friendGame = @"Dota 2";
    [group1 addObject:friend04];
    
    FriendsListModel *friend05 = [FriendsListModel new];
    friend05.friendImage = @"general_image_5";
    friend05.friendName = @"Ralf";
    friend05.friendStatus = @"In Game";
    friend05.friendGame = @"Crew";
    [group1 addObject:friend05];
    
    FriendsListModel *friend06 = [FriendsListModel new];
    friend06.friendImage = @"general_image_6";
    friend06.friendName = @"aeiks0";
    friend06.friendStatus = @"In Game";
    friend06.friendGame = @"NFS: MW2";
    [group1 addObject:friend06];
    
    FriendsListModel *friend07 = [FriendsListModel new];
    friend07.friendImage = @"general_image_7";
    friend07.friendName = @"Fast mar1o";
    friend07.friendStatus = @"In Game";
    friend07.friendGame = @"Counter-Strike 1.6";
    [group1 addObject:friend07];
    
#pragma mark - Fill Online Data
    
#pragma mark - Fill Offline Data
    
    NSMutableArray<FriendsListModel *> *group2 = [[NSMutableArray<FriendsListModel *> alloc] init];
    
    FriendsListModel *friend11 = [FriendsListModel new];
    friend11.friendImage = @"offline_image_1";
    friend11.friendName = @"Police Girl";
    friend11.friendStatus = @"Offline";
    friend11.friendGame = @"";
    [group2 addObject:friend01];
    
    FriendsListModel *friend12 = [FriendsListModel new];
    friend12.friendImage = @"offline_image_2";
    friend12.friendName = @"Panda F";
    friend12.friendStatus = @"Offline";
    friend12.friendGame = @"";
    [group2 addObject:friend02];
    
    FriendsListModel *friend13 = [FriendsListModel new];
    friend13.friendImage = @"offline_image_3";
    friend13.friendName = @"Lexus Is";
    friend13.friendStatus = @"Offline";
    friend13.friendGame = @"";
    [group2 addObject:friend03];
    
    FriendsListModel *friend14 = [FriendsListModel new];
    friend14.friendImage = @"offline_image_4";
    friend14.friendName = @"Ozaibergen";
    friend14.friendStatus = @"Offline";
    friend14.friendGame = @"";
    [group2 addObject:friend04];
    
#pragma mark - Fill Offline Data
    
#pragma mark - Fill Headers
    SettingsFriendsListModel *groupItem1 = [SettingsFriendsListModel new];
    groupItem1.title = [NSString stringWithFormat:@"General (%ld/%ld)", group1.count, group1.count + group2.count];
    groupItem1.friends = group1;
    [dataSourceArray addObject:groupItem1];
    
    SettingsFriendsListModel *groupItem2 = [SettingsFriendsListModel new];
    groupItem2.title = [NSString stringWithFormat:@"Offline (%ld/%ld)", group2.count, group1.count + group2.count];
    groupItem2.friends = group2;
    [dataSourceArray addObject:groupItem2];
#pragma mark - Fill Headers
    
    self.friendsOutlineView.delegate = self;
    self.friendsOutlineView.dataSource = self;
    
    [self.friendsOutlineView setTarget:self];
    [self.friendsOutlineView setAction:@selector(outlineViewClicked:)];
    [self.friendsOutlineView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];

    
    [self.friendsOutlineView reloadData];
}


#pragma mark - NSOutlineView

-(CGFloat)outlineView:(NSOutlineView *)outlineView heightOfRowByItem:(id)item {
    if ([item isKindOfClass:[FriendsListModel class]]) {
        return 46.0f;
    } else if ([item isKindOfClass:[SettingsFriendsListModel class]]) {
        return 50.0f;
    } else {
        return 0.0f;
    }
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (item == nil) {
        return dataSourceArray.count;
    } else if ([item isKindOfClass:[SettingsFriendsListModel class]]) {
        return ((SettingsFriendsListModel *)item).friends.count;
    } else {
        return 0;
    }
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (item == nil) {
        return dataSourceArray[index];
    } else {
        return (((SettingsFriendsListModel *)item).friends)[index];
    }
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    return [item isKindOfClass:[SettingsFriendsListModel class]];
}

- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    [outlineView expandItem:item];
    [outlineView setAutosaveExpandedItems:YES];
    return item;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    if ([item isKindOfClass:[SettingsFriendsListModel class]]) {
        SettingsFriendsListModel *model = (SettingsFriendsListModel *)item;
        FriendsHideCell *result = (FriendsHideCell *)[outlineView makeViewWithIdentifier:@"FriendsHideCell" owner:self];
        [result.label setStringValue:model.title];
        return result;
    } else {
        FriendsListModel *model = (FriendsListModel *)item;
        FriendsRightListCell *result = (FriendsRightListCell *)[outlineView makeViewWithIdentifier:@"FriendsRightListCell" owner:self];
        [result.playerImage setImage:[NSImage imageNamed:model.friendImage]];
        [result.playerNameLabel setStringValue:model.friendName];
        [result.playerStatusLabel setStringValue:model.friendStatus];
        [result.gameLabel setStringValue:model.friendGame];
        return result;
    }
    return nil;
}

- (void) outlineViewClicked:(NSOutlineView*)sender
{
    id clickItem = [sender itemAtRow:[self.friendsOutlineView clickedRow]];
    if([clickItem isKindOfClass:[SettingsFriendsListModel class]]) {
        NSImage *arrowImage;
        id clickedView = [sender viewAtColumn:0 row:[self.friendsOutlineView clickedRow] makeIfNecessary:NO];
        if(![sender isItemExpanded:clickItem]) {
            [sender expandItem:clickItem];
            arrowImage = [NSImage imageNamed:@"ic_up_arrow"];
        }else {
            [sender collapseItem:clickItem];
            arrowImage = [NSImage imageNamed:@"ic_down_arrow"];
        }
        if([clickedView isKindOfClass:[FriendsHideCell class]]) {
            [((FriendsHideCell *)clickedView).sisclosureImageView setImage:arrowImage];
            [((FriendsHideCell *)clickedView).sisclosureImageView setNeedsDisplay:YES];
        }
    } else if ([clickItem isKindOfClass:[FriendsListModel class]] && preSelectedRow != [self.friendsOutlineView clickedRow]) {
        FriendsRightListCell *cellView = (FriendsRightListCell *)[self.friendsOutlineView viewAtColumn:0 row:[self.friendsOutlineView clickedRow] makeIfNecessary:YES];
        FriendsRightListCell *preSelectedCellView = (FriendsRightListCell *)[self.friendsOutlineView viewAtColumn:0 row:preSelectedRow makeIfNecessary:YES];
        if(cellView != nil && [cellView isKindOfClass:[FriendsRightListCell class]])
        {
            cellView.lightLayer.hidden = NO;
        }
        
        if(preSelectedCellView != nil && [preSelectedCellView isKindOfClass:[FriendsRightListCell class]])
        {
            preSelectedCellView.lightLayer.hidden = YES;
        }
        preSelectedRow = [self.friendsOutlineView clickedRow];
        
        
        if([self.friendsOutlineView clickedRow] >= 9) {
            popover = [[NSPopover alloc] init];
            [popover setBehavior: NSPopoverBehaviorTransient];
            [popover setDelegate: self];
            popoverViewController = [[FriendProfileModalViewController alloc] initWithNibName: @"FriendProfileModalViewController" bundle: nil];
            [popover setContentViewController: popoverViewController];
            [popover setContentSize: popoverViewController.view.frame.size];
            [popover showRelativeToRect: cellView.bounds
                                 ofView: cellView
                          preferredEdge: NSMinYEdge | NSMinXEdge];
        } else {
            //SelfStatusModalViewController
            popover = [[NSPopover alloc] init];
            [popover setBehavior: NSPopoverBehaviorTransient];
            [popover setDelegate: self];
            popoverViewController1 = [[SelfStatusModalViewController alloc] initWithNibName: @"SelfStatusModalViewController" bundle: nil];
            [popover setContentViewController: popoverViewController1];
            [popover setContentSize: popoverViewController.view.frame.size];
            [popover showRelativeToRect: cellView.bounds
                                 ofView: cellView
                          preferredEdge: NSMinYEdge | NSMinXEdge];
        }
    }
}

-(void)viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    [self performSelector:@selector(expandAllItems) withObject:self afterDelay:0.0];
}

-(void)expandAllItems {
    for(NSInteger i = 0; i < self.friendsOutlineView.numberOfRows; i++) {
        id item = [self.friendsOutlineView itemAtRow:i];
        if([item isKindOfClass:[SettingsFriendsListModel class]]) {
            [self.friendsOutlineView expandItem:item];
        }
    }
}


@end
