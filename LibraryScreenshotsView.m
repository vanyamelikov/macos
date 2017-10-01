#import "LibraryScreenshotsView.h"

@implementation LibraryScreenshotsView

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
    self.collectionViewItem = [LibraryScreenshotItem new];
    
    self.contents = @[@{@"itemImage":@"library_screen_1"},
                      @{@"itemImage":@"library_screen_2"},
                      @{@"itemImage":@"library_screen_3"},
                      @{@"itemImage":@"library_screen_4"},];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
}

@end
