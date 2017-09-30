#import "StoreNavigationViewController.h"
#import "MainStoreViewController.h"
#import <BFNavigationController/BFNavigationController.h>

@interface StoreNavigationViewController () {
    BFNavigationController *_navigationController;
}

@end

@implementation StoreNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Store" bundle:nil];
    MainStoreViewController *mainStoreVC = (MainStoreViewController *)[sb instantiateControllerWithIdentifier:@"MainStoreViewController"];
    
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainStoreVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
