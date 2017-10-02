#import "NSView+INSNibLoading.h"

@interface StoreGameInfoView : INSNibLoadedView <NSTextFieldDelegate>

@property (strong) IBOutlet NSTextField *descriptionTextField;

@end
