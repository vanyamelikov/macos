#import "SettingsNavigationListView.h"
#import "SettingsNavigationListModel.h"
#import "SettingsNavigationListCell.h"
#import "SettingsNavigationListHeaderCell.h"

@implementation SettingsNavigationListView {
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
    
    SettingsNavigationListModel *model = [SettingsNavigationListModel new];
    model.title = @"Information";
    model.isHeader = YES;
    [dataSourceArray addObject:model];
    
    SettingsNavigationListModel *model1 = [SettingsNavigationListModel new];
    model1.title = @"Friends";
    model1.isHeader = NO;
    [dataSourceArray addObject:model1];
    
    SettingsNavigationListModel *model2 = [SettingsNavigationListModel new];
    model2.title = @"Games";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    SettingsNavigationListModel *model3 = [SettingsNavigationListModel new];
    model3.title = @"Inventory";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    SettingsNavigationListModel *model4 = [SettingsNavigationListModel new];
    model4.title = @"Screenshots";
    model4.isHeader = NO;
    [dataSourceArray addObject:model4];
    
    SettingsNavigationListModel *model5 = [SettingsNavigationListModel new];
    model5.title = @"Works in the workshop";
    model5.isHeader = NO;
    [dataSourceArray addObject:model5];
    
    SettingsNavigationListModel *model6 = [SettingsNavigationListModel new];
    model6.title = @"Review";
    model6.isHeader = NO;
    [dataSourceArray addObject:model6];
    
    SettingsNavigationListModel *model7 = [SettingsNavigationListModel new];
    model7.title = @"Manual";
    model7.isHeader = NO;
    [dataSourceArray addObject:model7];
    
    SettingsNavigationListModel *model8 = [SettingsNavigationListModel new];
    model8.title = @"Illustration";
    model8.isHeader = NO;
    [dataSourceArray addObject:model8];
    
    SettingsNavigationListModel *model9 = [SettingsNavigationListModel new];
    model9.title = @"Statistics";
    model9.isHeader = NO;
    [dataSourceArray addObject:model9];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView setSelectionHighlightStyle:NSTableViewSelectionHighlightStyleRegular];
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
    SettingsNavigationListModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader)
        return 40;
    else
        return 29;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    SettingsNavigationListModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader) {
        SettingsNavigationListHeaderCell *cell = (SettingsNavigationListHeaderCell *)[tableView makeViewWithIdentifier:@"SettingsNavigationListHeaderCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }else {
        SettingsNavigationListCell *cell = (SettingsNavigationListCell *)[tableView makeViewWithIdentifier:@"SettingsNavigationListCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }
}

@end
