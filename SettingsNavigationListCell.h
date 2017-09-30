#import "NSView+INSNibLoading.h"

@interface SettingsNavigationListCell : INSNibLoadedView

@property (strong) IBOutlet NSBox *backgroundBox;
@property (strong) IBOutlet NSTextField *label;
@property (strong) IBOutlet NSImageView *lightLayer;

@end
