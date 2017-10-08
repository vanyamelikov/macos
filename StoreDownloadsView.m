#import "StoreDownloadsView.h"
#import "StoreDownloadsModel.h"
#import "StoreDownloadsCell.h"

@implementation StoreDownloadsView {
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
    
    StoreDownloadsModel *model1 = [StoreDownloadsModel new];
    model1.gameImage = @"ic_downloads_1";
    model1.gameNameLabel = @"Crysis 2";
    model1.progressText = @"Downloaded: 25.3 MB / 4.0 GB (4%)";
    model1.progressView = 0;
    [dataSourceArray addObject:model1];
    
    StoreDownloadsModel *model2 = [StoreDownloadsModel new];
    model2.gameImage = @"ic_downloads_2";
    model2.gameNameLabel = @"Need For Speed MW 2";
    model2.progressText = @"Downloaded: 2.8 GB / 3.7 GB (62%)";
    model2.progressView = 0;
    [dataSourceArray addObject:model2];
    
    StoreDownloadsModel *model3 = [StoreDownloadsModel new];
    model3.gameImage = @"ic_downloads_3";
    model3.gameNameLabel = @"DIRT: Rally";
    model3.progressText = @"Downloaded: 3.1 GB / 6.8 GB (42%)";
    model3.progressView = 0;
    [dataSourceArray addObject:model3];
    
    StoreDownloadsModel *model4 = [StoreDownloadsModel new];
    model4.gameImage = @"ic_downloads_4";
    model4.gameNameLabel = @"Assassin's creed: Unity";
    model4.progressText = @"Downloaded: 8.9 GB / 9.4 GB (4%)";
    model4.progressView = 0;
    [dataSourceArray addObject:model4];
    
    StoreDownloadsModel *model5 = [StoreDownloadsModel new];
    model5.gameImage = @"ic_downloads_5";
    model5.gameNameLabel = @"SIMS 4";
    model5.progressText = @"Downloaded: 0 / 0.0 GB (0%)";
    model5.progressView = 0;
    [dataSourceArray addObject:model5];
    
    StoreDownloadsModel *model6 = [StoreDownloadsModel new];
    model6.gameImage = @"ic_downloads_6";
    model6.gameNameLabel = @"Medal Of Honor";
    model6.progressText = @"Downloaded: 0 / 0.0 GB (4%)";
    model6.progressView = 1;
    [dataSourceArray addObject:model6];
    
    StoreDownloadsModel *model7 = [StoreDownloadsModel new];
    model7.gameImage = @"ic_downloads_1";
    model7.gameNameLabel = @"Crysis 2";
    model7.progressText = @"Downloaded: 25.3 MB / 4.0 GB (4%)";
    model7.progressView = 1;
    [dataSourceArray addObject:model7];
    
    StoreDownloadsModel *model8 = [StoreDownloadsModel new];
    model8.gameImage = @"ic_downloads_2";
    model8.gameNameLabel = @"Need For Speed MW 2";
    model8.progressText = @"Downloaded: 2.8 GB / 3.7 GB (62%)";
    model8.progressView = 1;
    [dataSourceArray addObject:model8];
    
    StoreDownloadsModel *model9 = [StoreDownloadsModel new];
    model9.gameImage = @"ic_downloads_3";
    model9.gameNameLabel = @"DIRT: Rally";
    model9.progressText = @"Downloaded: 3.1 GB / 6.8 GB (42%)";
    model9.progressView = 0;
    [dataSourceArray addObject:model9];
    
    StoreDownloadsModel *model10 = [StoreDownloadsModel new];
    model10.gameImage = @"ic_downloads_4";
    model10.gameNameLabel = @"Assassin's creed: Unity";
    model10.progressText = @"Downloaded: 8.9 GB / 9.4 GB (4%)";
    model10.progressView = 1;
    [dataSourceArray addObject:model10];
    
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
    
    return 61;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    StoreDownloadsModel *model = [dataSourceArray objectAtIndex:row];
    StoreDownloadsCell *cell = (StoreDownloadsCell *)[tableView makeViewWithIdentifier:@"StoreGamesCell" owner:self];
    [cell.gameImage setImage:[NSImage imageNamed:model.gameImage]];
    [cell.gameNameLabel setStringValue:model.gameNameLabel];
    [cell.downloadLabel setStringValue:model.progressText];
    if(model.progressView == 0) {
        [cell.progressBox setHidden:NO];
        [cell.expectationView setHidden:YES];
    } else if(model.progressView == 1) {
        [cell.progressBox setHidden:YES];
        [cell.expectationView setHidden:NO];
    }
    return cell;
}

@end
