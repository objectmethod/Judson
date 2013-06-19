#import "KLSideMenuViewController.h"
#import "MFSideMenu.h"
#import "JCEventDetailsViewController.h"
#import "JCEventScheduleViewController.h"
#import "JCEventFieldViewController.h"
#import "JCTicketSalesViewController.h"

#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface KLSideMenuViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation KLSideMenuViewController

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.parentViewController;
}

#pragma mark - Table view delegate

typedef NS_ENUM(int, KLSideMenuIndexPathRow) {
	KLSideMenuIndexPathRowEventDetails = 0,
	KLSideMenuIndexPathRowEventSchedule = 1,
	KLSideMenuIndexPathRowTheField = 2,
	KLSideMenuIndexPathRowLiveScoring = 3,
	KLSideMenuIndexPathRowTicketSales = 4,
	KLSideMenuIndexPathRowSendFeedback = 5,
	KLSideMenuIndexPathRowAbout = 6,
};

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
	
	switch (indexPath.row) {
		case KLSideMenuIndexPathRowEventDetails:
			[self showEventDetails];
			break;
		case KLSideMenuIndexPathRowEventSchedule:
			[self sendEventSchedule];
			break;
		case KLSideMenuIndexPathRowTheField:
			[self showTheField];
			break;
		case KLSideMenuIndexPathRowLiveScoring:
			[self showLiveScoring];
			break;
		case KLSideMenuIndexPathRowTicketSales:
			[self showTicketSales];
			break;
		case KLSideMenuIndexPathRowSendFeedback:
			[self sendFeedback];
			break;
		case KLSideMenuIndexPathRowAbout:
			[self showAbout];
			break;
		default:
			break;
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Menu Items

- (void) showAbout {
	[[[UIAlertView alloc] initWithTitle:@"About Judson" message:@"This app is created for the greatest golf coach in the world: Jackie Cannizzo by her greatest student, Richard Guy" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (void) showTicketSales  {
	[self showViewControllerOfClass:[JCTicketSalesViewController class] completion:nil];
}

- (void) showEventDetails  {
	[self showViewControllerOfClass:[JCEventDetailsViewController class] completion:nil];
}

- (void) showTheField {
	[self showViewControllerOfClass:[JCEventFieldViewController class] completion:nil];
}

- (void) sendEventSchedule {
	[self showViewControllerOfClass:[JCEventScheduleViewController class] completion:nil];
}

- (void) showLiveScoring {
	[[[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Live Scoring is not available yet." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
}

- (UIViewController*) showViewControllerOfClass:(Class)class completion:(void(^)(UIViewController *viewController))completion {
	UIViewController *viewController;
	
	UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
	
	if (![navigationController.visibleViewController isKindOfClass:class]) {
		viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass(class)];
		if (completion) {
			completion(viewController);
		}		
		NSArray *controllers = [NSArray arrayWithObject:viewController];
		navigationController.viewControllers = controllers;
	}
	
	return viewController;
}

- (void) sendFeedback {
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
		mailViewController.mailComposeDelegate = self;
		[mailViewController setToRecipients:@[@"jacgolf32@aol.com"]];
		[mailViewController setSubject:@"Judson iPhone App Feedback"];

		UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
		[navigationController presentViewController:mailViewController animated:YES completion:nil];
	}
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
