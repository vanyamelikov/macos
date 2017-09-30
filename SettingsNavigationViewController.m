
#import "SettingsNavigationViewController.h"
#import <BFNavigationController/BFNavigationController.h>
#import "SettingsViewController.h"

@interface SettingsNavigationViewController () {
    BFNavigationController *_navigationController;
}

@end

@implementation SettingsNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Settings" bundle:nil];
    SettingsViewController *mainSettingsVC = (SettingsViewController *)[sb instantiateControllerWithIdentifier:@"SettingsNavigationController"];
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainSettingsVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
