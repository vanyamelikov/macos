#import "LibraryGamesRightMenuView.h"
#import "LibraryGamesRightMenuModel.h"
#import "LibraryGamesRightMenuCell.h"
#import "LibraryGamesRightMenuHeaderCell.h"

@implementation LibraryGamesRightMenuView {
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
    
    LibraryGamesRightMenuModel *model = [LibraryGamesRightMenuModel new];
    model.title = @"Links";
    model.isHeader = YES;
    [dataSourceArray addObject:model];
    
    LibraryGamesRightMenuModel *model1 = [LibraryGamesRightMenuModel new];
    model1.title = @"Community Hub";
    model1.isHeader = NO;
    [dataSourceArray addObject:model1];
    
    LibraryGamesRightMenuModel *model2 = [LibraryGamesRightMenuModel new];
    model2.title = @"Discussions";
    model2.isHeader = NO;
    [dataSourceArray addObject:model2];
    
    LibraryGamesRightMenuModel *model3 = [LibraryGamesRightMenuModel new];
    model3.title = @"Related Groups";
    model3.isHeader = NO;
    [dataSourceArray addObject:model3];
    
    LibraryGamesRightMenuModel *model4 = [LibraryGamesRightMenuModel new];
    model4.title = @"Manual";
    model4.isHeader = NO;
    [dataSourceArray addObject:model4];
    
    LibraryGamesRightMenuModel *model5 = [LibraryGamesRightMenuModel new];
    model5.title = @"News";
    model5.isHeader = NO;
    [dataSourceArray addObject:model5];
    
    LibraryGamesRightMenuModel *model6 = [LibraryGamesRightMenuModel new];
    model6.title = @"Store Page";
    model6.isHeader = NO;
    [dataSourceArray addObject:model6];
    
    LibraryGamesRightMenuModel *model7 = [LibraryGamesRightMenuModel new];
    model7.title = @"Community Guidelines";
    model7.isHeader = NO;
    [dataSourceArray addObject:model7];
    
    LibraryGamesRightMenuModel *model8 = [LibraryGamesRightMenuModel new];
    model8.title = @"Support";
    model8.isHeader = NO;
    [dataSourceArray addObject:model8];
    
    LibraryGamesRightMenuModel *model9 = [LibraryGamesRightMenuModel new];
    model9.title = @"Write a review";
    model9.isHeader = NO;
    [dataSourceArray addObject:model9];
    
    LibraryGamesRightMenuModel *model10 = [LibraryGamesRightMenuModel new];
    model10.title = @"Categories";
    model10.isHeader = YES;
    [dataSourceArray addObject:model10];
    
    LibraryGamesRightMenuModel *model11 = [LibraryGamesRightMenuModel new];
    model11.title = @"Favorites";
    model11.isHeader = NO;
    [dataSourceArray addObject:model11];
    
    LibraryGamesRightMenuModel *model12 = [LibraryGamesRightMenuModel new];
    model12.title = @"First Person Shooter";
    model12.isHeader = NO;
    [dataSourceArray addObject:model12];
    
    LibraryGamesRightMenuModel *model13 = [LibraryGamesRightMenuModel new];
    model13.title = @"Third Person Shooter";
    model13.isHeader = NO;
    [dataSourceArray addObject:model13];
    
    LibraryGamesRightMenuModel *model14 = [LibraryGamesRightMenuModel new];
    model14.title = @"Change Categories";
    model14.isHeader = NO;
    [dataSourceArray addObject:model14];
    
    LibraryGamesRightMenuModel *model15 = [LibraryGamesRightMenuModel new];
    model15.title = @"News";
    model15.isHeader = NO;
    [dataSourceArray addObject:model15];
    
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
    LibraryGamesRightMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader)
        return 60;
    else
        return 29;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    LibraryGamesRightMenuModel *model = [dataSourceArray objectAtIndex:row];
    if(model.isHeader) {
        LibraryGamesRightMenuHeaderCell *cell = (LibraryGamesRightMenuHeaderCell *)[tableView makeViewWithIdentifier:@"LibraryGamesRightMenuHeaderCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }else {
        LibraryGamesRightMenuCell *cell = (LibraryGamesRightMenuCell *)[tableView makeViewWithIdentifier:@"LibraryGamesRightMenuCell" owner:self];
        cell.label.stringValue = model.title;
        return cell;
    }
}


@end
