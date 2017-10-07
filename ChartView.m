
#import "ChartView.h"

@implementation ChartView {
    NSPoint currentPoint;
}

@synthesize barWidth, barMargin;
@synthesize currentPercent;

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if(self) {
        
    }
}

-(void)viewDidMoveToWindow {
    [super viewDidMoveToWindow];
    
}

-(instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if(self) {
        [self preDrawBackBarChart];
    }
    return self;
}

-(void)updateBackBar {
    NSInteger startPosition = self.mainBoxView.subviews.count - 1;
    CGFloat displayHeight = self.mainBox.frame.size.height * currentPercent/100;
    for(NSInteger i = startPosition; i >= 0 ; i--) {
        NSView *currentView = [self.mainBoxView.subviews objectAtIndex:i];
        CGFloat currentHeight = currentView.frame.size.height;
        currentView.frame = CGRectMake(currentView.frame.origin.x, currentView.frame.origin.y, currentView.frame.size.width, displayHeight);
        displayHeight = currentHeight;
    }
    [self.lineChartView setFirstLinePercent:currentPercent];
    [self.lineChartView setSecondLinePercent:currentPercent];
    [self.lineChartView updateLines];
    [self setNeedsDisplay:YES];
}



-(void)preDrawBackBarChart {
    [self.mainBoxView setSubviews:@[]];
    if(self.barWidth == 0)
        self.barWidth = 4;
    if(self.barMargin == 0)
        self.barMargin = 4;
    CGFloat summ = self.barMargin + self.barWidth;
    int count = self.bounds.size.width / summ;
    for(int i = 0; i < count; i ++) {
        NSBox *barBox = [[NSBox alloc] initWithFrame:CGRectMake(summ*i, 0, barWidth, 0)];
        [barBox setBoxType:NSBoxCustom];
        [barBox setFillColor:[NSColor colorFromHexString:@"#1d202b"]];
        [self.mainBox addSubview:barBox];
    }
}

-(NSDictionary *) createPointDictionary : (NSPoint) point {
    return @{@"x":[NSNumber numberWithFloat:point.x], @"y":[NSNumber numberWithFloat:point.y]};
}

-(NSPoint) createPointFromDictionary : (NSDictionary *) dict {
    CGFloat x = [(NSNumber *)[dict objectForKey:@"x"] floatValue];
    CGFloat y = [(NSNumber *)[dict objectForKey:@"y"] floatValue];
    return CGPointMake(x, y);
}


- (void)someBackgroundTask:(NSTimer *)timer {
    float low_bound = 5;
    float high_bound = 95;
    float rndValue = (((float)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
    [self setCurrentPercent:rndValue];
    [self updateBackBar];
}

@end
