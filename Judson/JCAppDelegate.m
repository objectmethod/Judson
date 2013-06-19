#import "JCAppDelegate.h"
#import "KLCoreDataController.h"

@implementation JCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[[KLCoreDataController sharedInstance] saveContext];
}

@end
