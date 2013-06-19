#import "JCAppDelegate.h"
#import "KLCoreDataController.h"
#import "MFSideMenu.h"
#import "KLSideMenuViewController.h"

@interface JCAppDelegate ()

@property (strong, nonatomic) UIStoryboard *storyboard;
@property (strong, nonatomic) MFSideMenuContainerViewController *container;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIViewController *leftSideMenuViewController;

@end

@implementation JCAppDelegate

#pragma mark - Side Menu

- (void) setupSideMenu {
	self.storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:[NSBundle mainBundle]];
    self.container = (MFSideMenuContainerViewController *)self.window.rootViewController;
    self.navigationController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([UINavigationController class])];
    self.leftSideMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([KLSideMenuViewController class])];
    
    [self.container setLeftMenuViewController:self.leftSideMenuViewController];
    [self.container setCenterViewController:self.navigationController];
}

#pragma mark - AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self setupSideMenu];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[KLCoreDataController sharedInstance] saveContext];
}

@end
