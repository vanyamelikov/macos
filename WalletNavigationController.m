#import "WalletNavigationController.h"
#import <BFNavigationController/BFNavigationController.h>
#import "WalletViewController.h"

@interface WalletNavigationController () {
    BFNavigationController *_navigationController;
}

@end

@implementation WalletNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Wallet" bundle:nil];
     WalletViewController *mainStoreVC = (WalletViewController *)[sb instantiateControllerWithIdentifier:@"WalletNavigationViewController"];
    
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainStoreVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
