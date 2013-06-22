#import "JCAppDelegate.h"
#import "KLCoreDataController.h"
#import "MFSideMenu.h"
#import "KLSideMenuViewController.h"
#import "TestFlight.h"

@interface JCAppDelegate ()

@property (strong, nonatomic) UIStoryboard *storyboard;
@property (strong, nonatomic) MFSideMenuContainerViewController *container;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UIViewController *leftSideMenuViewController;

@end

@implementation JCAppDelegate

#pragma mark - Test Flight

- (void) setupTestFlight {
	[TestFlight setDeviceIdentifier:[[UIDevice currentDevice] uniqueIdentifier]];
	[TestFlight takeOff:@"0e1bb9d2-b4fe-4315-b1c9-b415e09ec01a"];
}

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
	[self setupTestFlight];
	[self setupSideMenu];	
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[KLCoreDataController sharedInstance] saveContext];
}

@end
