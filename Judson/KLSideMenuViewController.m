#import "KLSideMenuViewController.h"
#import "MFSideMenu.h"

@interface KLSideMenuViewController ()

@property (readonly) MFSideMenuContainerViewController *menuContainerViewController;

@end

@implementation KLSideMenuViewController

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.parentViewController;
}

#pragma mark - Table view delegate

typedef NS_ENUM(int, KLSideMenuIndexPathRow) {
	KLSideMenuIndexPathRowProfile = 0,
	KLSideMenuIndexPathRowSubmitFeedback = 1,
	KLSideMenuIndexPathRowPlaces = 2,
	KLSideMenuIndexPathRowLogout = 3,
};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
	
	switch (indexPath.row) {
		case KLSideMenuIndexPathRowProfile:
			[self showProfile];
			break;
		case KLSideMenuIndexPathRowSubmitFeedback:
			[self sendFeedback];
			break;
		case KLSideMenuIndexPathRowLogout:
			[self logout];
			break;
		case KLSideMenuIndexPathRowPlaces:
			[self showPlaces];
			break;
		default:
			break;
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Menu Items

- (void) showProfile  {
	
}

- (void) showPlaces {
	
}

- (void) sendFeedback {
	
}

- (void) logout {
	
}

@end
