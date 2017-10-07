#import "NSView+INSNibLoading.h"


@class StoreMainGridView;
@protocol StoreMainGridViewDelegate <NSObject>
-(void)openGameDetail;
@end

@interface StoreMainGridView : INSNibLoadedView

@property (weak) IBOutlet NSImageView *storeImage1;
@property (weak) IBOutlet NSImageView *storeImage2;
@property (weak) IBOutlet NSImageView *storeImage3;
@property (weak) IBOutlet NSImageView *storeImage4;
@property (weak) IBOutlet NSImageView *storeImage5;
@property (weak) IBOutlet NSImageView *storeImage6;
@property (weak) IBOutlet NSImageView *storeImage7;
@property (weak) IBOutlet NSImageView *storeImage8;
@property (weak) IBOutlet NSImageView *storeImage9;

@property (nonatomic, weak) id<StoreMainGridViewDelegate> delegate;

@end
