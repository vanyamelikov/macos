#import <Cocoa/Cocoa.h>
#import "NSView+INSNibLoading.h"
#import "AddGame.h"
#import "Colours.h"

@class LibraryEmptySideMenu;
@protocol LibraryEmptySideMenuDelegate <NSObject>
- (void) itemClicked: (NSInteger) sender : (NSString *)title;
@end

@interface LibraryEmptySideMenu : INSNibLoadedView <NSTableViewDelegate, NSTableViewDataSource, NSPopoverDelegate>
@property (weak) IBOutlet NSBox *backgroundBox;
@property (weak) IBOutlet AddGame *addGameButton;
@property (weak) IBOutlet NSTableView *tableView;

@property (nonatomic, weak) id <LibraryEmptySideMenuDelegate> delegate;

@end
