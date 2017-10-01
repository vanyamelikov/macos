#import "MainWindow.h"
#import <QuartzCore/QuartzCore.h>
#import "ImageUtils.h"

@implementation MainWindow {
    NSImageView *backImageView;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.delegate = self;
    [self setOpaque:NO];
    [self setMovableByWindowBackground:YES];
    [self.contentView setWantsLayer:YES];
    [self.contentView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    [self setAllowsConcurrentViewDrawing:YES];
}

-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

-(void)windowWillStartLiveResize:(NSNotification *)notification {
    
}

@end
