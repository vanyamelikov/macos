#import "MainWindow.h"
#import <QuartzCore/QuartzCore.h>

@implementation MainWindow

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setMovableByWindowBackground:YES];
    [self.contentView setWantsLayer:YES];
    [self.contentView setLayerContentsRedrawPolicy:NSViewLayerContentsRedrawOnSetNeedsDisplay];
    
    if(self.backgroundImageName != nil)
        [self setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:self.backgroundImageName]]];
    else
        [self setBackgroundColor:[NSColor colorWithPatternImage:[NSImage imageNamed:@"Background"]]];
    
}

-(instancetype)init {
    self = [super init];
    if(self) {
        
    }
    return self;
}

-(void)changeBackgroundImage : (NSImage *)image {
    [self setBackgroundColor:[NSColor colorWithPatternImage:image]];
    [self.contentView setNeedsDisplay:YES];
}

@end
