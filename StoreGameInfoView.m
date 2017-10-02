#import "StoreGameInfoView.h"

@implementation StoreGameInfoView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    self.descriptionTextField.delegate = self;
}

- (BOOL)textFieldShouldBeginEditing:(NSTextField *)textField{
    return NO;
}

@end
