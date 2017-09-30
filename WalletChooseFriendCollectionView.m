
#import "WalletChooseFriendCollectionView.h"

@implementation WalletChooseFriendCollectionView

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
    self.collectionViewItem = [WalletChooseFriendItem new];
    self.contents = @[@{@"itemImage":@"img_cf_a1", @"itemTag":@"0"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"1"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"2"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"3"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"4"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"5"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"6"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"7"},
                      @{@"itemImage":@"img_cf_a1", @"itemTag":@"8"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
    self.collectionView.selectable = YES;
}



@end
