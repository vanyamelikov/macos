#import "BuyGameScreenshotsView.h"

@implementation BuyGameScreenshotsView

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
    self.collectionViewItem = [BuyGameScreenshotItem new];
    
    self.contents = @[@{@"itemImage":@"img_buy_screen_1"},
                      @{@"itemImage":@"img_buy_screen_2"},
                      @{@"itemImage":@"img_buy_screen_3"},
                      @{@"itemImage":@"img_buy_screen_4"},
                      @{@"itemImage":@"img_buy_screen_5"},
                      @{@"itemImage":@"img_buy_screen_6"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
