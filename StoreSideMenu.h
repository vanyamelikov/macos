#import "NSView+INSNibLoading.h"
#import "Colours.h"

@class StoreSideMenu;
@protocol StoreSideMenuDelegate <NSObject>
- (void) itemClicked: (NSInteger) sender : (NSString *)title;
@end

@interface StoreSideMenu : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource>

@property (strong) IBOutlet NSTableView *tableView;

@property (nonatomic, weak) id <StoreSideMenuDelegate> delegate;

@end
