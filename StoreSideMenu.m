#import "StoreSideMenu.h"
#import "StoreSideMenuCell.h"
#import "StoreSideMenuHeaderCell.h"
#import "StoreSideMenuModel.h"
#import <CoreImage/CoreImage.h>

@implementation StoreSideMenu {
    NSMutableArray *dataSourceArray;
    NSInteger preSelectedRow;
}

@synthesize delegate;

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
    
    StoreSideMenuModel *model_space1 = [StoreSideMenuModel new];
    model_space1.headerSpace = 10.0f;
    model_space1.isHeader = YES;
    [dataSourceArray addObject:model_space1];
    
    StoreSideMenuModel *model1 = [StoreSideMenuModel new];
    model1.title = @"RECOMENDED";
    model1.isHeader = YES;
    [dataSourceArray addObject:model1];
    
    StoreSideMenuModel *model2 = [StoreSideMenuModel new];
    model2.title = @"Featured";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    StoreSideMenuModel *model3 = [StoreSideMenuModel new];
    model3.title = @"Popular";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    StoreSideMenuModel *model4 = [StoreSideMenuModel new];
    model4.title = @"New";
    model4.isHeader = NO;
    [dataSourceArray addObject:model4];
    
    StoreSideMenuModel *model_space2 = [StoreSideMenuModel new];
    model_space2.headerSpace = 20.0f;
    model_space2.isHeader = YES;
    [dataSourceArray addObject:model_space2];
    
    StoreSideMenuModel *model5 = [StoreSideMenuModel new];
    model5.title = @"REVIEW OF CATEGORIES";
    model5.isHeader = YES;
    [dataSourceArray addObject:model5];
    
    StoreSideMenuModel *model6 = [StoreSideMenuModel new];
    model6.title = @"Leaders of sells";
    model6.isHeader = NO;
    [dataSourceArray addObject:model6];
    
    StoreSideMenuModel *model7 = [StoreSideMenuModel new];
    model7.title = @"Recently Updated";
    model7.isHeader = NO;
    [dataSourceArray addObject:model7];
    
    StoreSideMenuModel *model8 = [StoreSideMenuModel new];
    model8.title = @"New items";
    model8.isHeader = NO;
    [dataSourceArray addObject:model8];
    
    StoreSideMenuModel *model9 = [StoreSideMenuModel new];
    model9.title = @"The coming soon";
    model9.isHeader = NO;
    [dataSourceArray addObject:model9];
    
    StoreSideMenuModel *model10 = [StoreSideMenuModel new];
    model10.title = @"Skins";
    model10.isHeader = NO;
    [dataSourceArray addObject:model10];
    
    StoreSideMenuModel *model11 = [StoreSideMenuModel new];
    model11.title = @"A virtual reality";
    model11.isHeader = NO;
    [dataSourceArray addObject:model11];
    
    StoreSideMenuModel *model_space3 = [StoreSideMenuModel new];
    model_space3.headerSpace = 20.0f;
    model_space3.isHeader = YES;
    [dataSourceArray addObject:model_space3];
    
    StoreSideMenuModel *model12 = [StoreSideMenuModel new];
    model12.title = @"SEARCH OF THE GENRE";
    model12.isHeader = YES;
    [dataSourceArray addObject:model12];
    
    StoreSideMenuModel *model13 = [StoreSideMenuModel new];
    model13.title = @"Is free";
    model13.isHeader = NO;
    [dataSourceArray addObject:model13];
    
    StoreSideMenuModel *model14 = [StoreSideMenuModel new];
    model14.title = @"Early Access";
    model14.isHeader = NO;
    [dataSourceArray addObject:model14];
    
    StoreSideMenuModel *model15 = [StoreSideMenuModel new];
    model15.title = @"Race";
    model15.isHeader = NO;
    [dataSourceArray addObject:model15];
    
    StoreSideMenuModel *model16 = [StoreSideMenuModel new];
    model16.title = @"Indies";
    model16.isHeader = NO;
    [dataSourceArray addObject:model16];
    
    StoreSideMenuModel *model17 = [StoreSideMenuModel new];
    model17.title = @"Casual Game";
    model17.isHeader = NO;
    [dataSourceArray addObject:model17];
    
    StoreSideMenuModel *model18 = [StoreSideMenuModel new];
    model18.title = @"IMO";
    model18.isHeader = NO;
    [dataSourceArray addObject:model18];
    
    StoreSideMenuModel *model19 = [StoreSideMenuModel new];
    model19.title = @"Adventure Game";
    model19.isHeader = NO;
    [dataSourceArray addObject:model19];
    
    StoreSideMenuModel *model20 = [StoreSideMenuModel new];
    model20.title = @"Role-playing game";
    model20.isHeader = NO;
    [dataSourceArray addObject:model20];
    
    StoreSideMenuModel *model21 = [StoreSideMenuModel new];
    model21.title = @"Simulator";
    model21.isHeader = NO;
    [dataSourceArray addObject:model21];
    
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
