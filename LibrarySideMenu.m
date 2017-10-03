#import "LibrarySideMenu.h"
#import "LibrarySideMenuCell.h"
#import "LibrarySideMenuModel.h"
#import "Colours.h"
#import "SelfStatusModalViewController.h"

@implementation LibrarySideMenu {
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
    NSPopover *popover;
    SelfStatusModalViewController *popoverViewController;
}

- (IBAction)showPopupClick:(NSClickGestureRecognizer *)sender {
    popover = [[NSPopover alloc] init];
    [popover setBehavior: NSPopoverBehaviorTransient];
    [popover setDelegate: self];
    popoverViewController = [[SelfStatusModalViewController alloc] initWithNibName: @"SelfStatusModalViewController" bundle: nil];
    [popover setContentViewController: popoverViewController];
    [popover setContentSize: popoverViewController.view.frame.size];
    [popover showRelativeToRect: sender.view.bounds
                         ofView: sender.view
                  preferredEdge: NSMaxYEdge | NSMaxXEdge];
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
    NSArray *titleArray = @[@"Counter Strike 1,6",
                            @"Counter Strike Condition Zero",
                            @"Crysis 2", @"Dary at Defeat",
                            @"Dead Island : Epidemic",
                            @"Deathmatch Classic",
                            @"Dota 2",
                            @"Dota 2 Test",
                            @"Kane & Leanch : Dog Days",
                            @"Mafia 2",
                            @"Medal of Honor",
                            @"Nation Red",
                            @"Ricochat"];
    dataSourceArray = [[NSMutableArray alloc] initWithArray:titleArray];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    [self.tableView selectRowIndexes:indexSet byExtendingSelection:NO];
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 30.0f;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    LibrarySideMenuCell *cell = (LibrarySideMenuCell *)[tableView makeViewWithIdentifier:@"LibrarySideMenuCell" owner:self];
    cell.label.stringValue = [dataSourceArray objectAtIndex:row];
    return cell;
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger index = [self.tableView selectedRow];
    if(index != preSelectedRow) {
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
    }
}

@end














