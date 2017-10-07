#import "StoreMainGridView.h"

@implementation StoreMainGridView {
    NSArray *items;
}

@synthesize delegate;

-(void)awakeFromNib {
    [super awakeFromNib];
    if(self) {
        [self initView];
    }
}

-(instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
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
    items = @[self.storeImage1,
              self.storeImage2,
              self.storeImage3,
              self.storeImage4,
              self.storeImage5,
              self.storeImage6,
              self.storeImage7,
              self.storeImage8,
              self.storeImage9];
    for (NSView *itemView in items) {
        [itemView setWantsLayer: YES];
        [itemView.layer setCornerRadius:2.0f];
        itemView.layer.masksToBounds = YES;
    }
}
- (IBAction)openStoreGameDetailClick:(id)sender {
    if(delegate && [self.delegate respondsToSelector:@selector(openGameDetail)]) {
        [self.delegate openGameDetail];
    }
}

@end
