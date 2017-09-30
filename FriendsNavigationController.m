
#import "FriendsNavigationController.h"
#import <BFNavigationController/BFNavigationController.h>
#import "FriendsViewController.h"

@interface FriendsNavigationController () {
    BFNavigationController *_navigationController;
}

@end

@implementation FriendsNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Friends" bundle:nil];
    FriendsViewController *mainFriendsVC = (FriendsViewController *)[sb instantiateControllerWithIdentifier:@"FriendsListNavigationController"];
    _navigationController = [[BFNavigationController alloc] initWithFrame:NSMakeRect(0, 0, self.view.frame.size.width, self.view.frame.size.height)
                                                       rootViewController:mainFriendsVC];
    
    [self.view addSubview:_navigationController.view];
}

@end
