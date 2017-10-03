#import "LibraryEmptySideMenu.h"
#import "StoreSideMenuCell.h"
#import "StoreSideMenuHeaderCell.h"
#import "StoreSideMenuModel.h"
#import <CoreImage/CoreImage.h>
#import "SelfStatusModalViewController.h"

@implementation LibraryEmptySideMenu{
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
    NSPopover *popover;
    SelfStatusModalViewController *popoverViewController;
}

@synthesize delegate;

-(void)awakeFromNib {
    [super awakeFromNib];
}
- (IBAction)showPopoverClick:(NSClickGestureRecognizer *)sender {
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
    
    StoreSideMenuModel *model_space1 = [StoreSideMenuModel new];
    model_space1.headerSpace = 10.0f;
    model_space1.isHeader = YES;
    [dataSourceArray addObject:model_space1];
    
    StoreSideMenuModel *model1 = [StoreSideMenuModel new];
    model1.title = @"XENIO RECOMMENDS";
    model1.isHeader = YES;
    [dataSourceArray addObject:model1];
    
    StoreSideMenuModel *model2 = [StoreSideMenuModel new];
    model2.title = @"Popular";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    StoreSideMenuModel *model3 = [StoreSideMenuModel new];
    model3.title = @"New";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    StoreSideMenuModel *model4 = [StoreSideMenuModel new];
    model4.title = @"Best games";
    model4.isHeader = NO;
    [dataSourceArray addObject:model4];
    
    [self.tableView setIntercellSpacing:NSZeroSize];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleNone];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:2];
    [self.tableView selectRowIndexes:indexSet byExtendingSelection:NO];
}

#pragma mark - TableViewDataSource

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [dataSourceArray count];
}

#pragma mark - TableViewDelegate

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    StoreSideMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader && model.headerSpace > 0)
        return model.headerSpace;
    else if (model.isHeader && model.headerSpace <= 0)
        return 50.0f;
    else
        return 30.0f;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    StoreSideMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader && model.headerSpace > 0) {
        NSBox *emptyBox = [[NSBox alloc] initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  tableView.frame.size.width,
                                                                  model.headerSpace)];
        [emptyBox setBoxType:NSBoxCustom];
        [emptyBox setBorderType:NSNoBorder];
        [emptyBox setBorderColor:[NSColor clearColor]];
        [emptyBox setBorderWidth:0.0f];
        [emptyBox setFillColor:[NSColor clearColor]];
        return emptyBox;
    }
    else if(model.isHeader && model.headerSpace <= 0) {
        StoreSideMenuHeaderCell *cell = (StoreSideMenuHeaderCell *)[tableView makeViewWithIdentifier:@"StoreSideMenuHeaderCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }
    else {
        StoreSideMenuCell *cell = (StoreSideMenuCell *)[tableView makeViewWithIdentifier:@"StoreSideMenuCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }
}

-(void)tableViewSelectionDidChange:(NSNotification *)notification {
    NSInteger index = [self.tableView selectedRow];
    StoreSideMenuModel *model = [dataSourceArray objectAtIndex:index];
    if(!model.isHeader && index != preSelectedRow) {
        StoreSideMenuCell *cellView = (StoreSideMenuCell *)[self.tableView viewAtColumn:0 row:index makeIfNecessary:YES];
        StoreSideMenuCell *preSelectedCellView = (StoreSideMenuCell *)[self.tableView viewAtColumn:0 row:preSelectedRow makeIfNecessary:YES];
        if(cellView != nil && [cellView isKindOfClass:[StoreSideMenuCell class]])
        {
            cellView.lightLayer.hidden = NO;
            [cellView.label setTextColor:[NSColor colorFromHexString:@"#ffffff"]];
        }
        
        if(preSelectedCellView != nil && [preSelectedCellView isKindOfClass:[StoreSideMenuCell class]])
        {
            preSelectedCellView.lightLayer.hidden = YES;
            [preSelectedCellView.label setTextColor:[NSColor colorFromHexString:@"#78819F"]];
        }
        preSelectedRow = index;
        if(delegate && [self.delegate respondsToSelector:@selector(itemClicked::)]) {
            [self.delegate itemClicked:index:model.title];
        }
    }
}


@end
