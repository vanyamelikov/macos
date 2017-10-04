
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
    self.contents = @[@{@"itemImage":@"img_wallet_friend_1", @"itemTag":@"0"},
                      @{@"itemImage":@"img_wallet_friend_2", @"itemTag":@"1"},
                      @{@"itemImage":@"img_wallet_friend_3", @"itemTag":@"2"},
                      @{@"itemImage":@"img_wallet_friend_4", @"itemTag":@"3"},
                      @{@"itemImage":@"img_wallet_friend_5", @"itemTag":@"4"},
                      @{@"itemImage":@"img_wallet_friend_6", @"itemTag":@"5"},
                      @{@"itemImage":@"img_wallet_friend_7", @"itemTag":@"6"},
                      @{@"itemImage":@"img_wallet_friend_8", @"itemTag":@"7"},
                       @{@"itemImage":@"img_wallet_friend_2", @"itemTag":@"8"}];
    [self.collectionView setMaxNumberOfRows:1];
    [self.collectionView setItemPrototype:self.collectionViewItem];
    
    [self.collectionView setContent:self.contents];
    self.collectionView.selectable = YES;
}



@end
