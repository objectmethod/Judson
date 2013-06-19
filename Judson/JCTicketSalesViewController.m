#import "JCTicketSalesViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface JCTicketSalesViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation JCTicketSalesViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
	
	switch (indexPath.section) {
		case 0:
			switch (indexPath.row) {
				case 0:
					[self openTicketSales];
					break;
				default:
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
					break;
				default:
					break;
			}
			break;
		case 2:
			switch (indexPath.row) {
				case 0:
					[self sendEmail];
					break;
				case 1:
					[self callPhone];
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}
}

- (void) openTicketSales {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.thelegendstour.com/tickets/"]];
}

- (void) callPhone {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://4042813210"]];
}

- (void) sendEmail {
	if ([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
		mailViewController.mailComposeDelegate = self;
		[mailViewController setToRecipients:@[@"kelly@judsongolf.com"]];
		[mailViewController setSubject:@"Judson Ticket Sales"];
		
		UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
		[navigationController presentViewController:mailViewController animated:YES completion:nil];
	}
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
