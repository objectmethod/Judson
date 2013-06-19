#import "JCEventDetailsViewController.h"
#import "MFSideMenu.h"

@interface JCEventDetailsViewController ()

- (IBAction)menuButtonClicked:(id)sender;

@end

@implementation JCEventDetailsViewController

- (IBAction)menuButtonClicked:(id)sender {
	[self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	switch (indexPath.section) {
		case 0:
			switch (indexPath.row) {
				case 0:
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
					break;
				default:
					break;
			}
			break;
		case 3:
			switch (indexPath.row) {
				case 0:
					break;
				default:
					break;
			}
			break;
		case 4:
			switch (indexPath.row) {
				case 0:
					[self showCharity];
					break;
				default:
					break;
			}
			break;
		case 5:
			switch (indexPath.row) {
				case 0:
					[self showWebsite];
					break;
				default:
					break;
			}
			break;
		default:
			break;
	}
}

- (void) showCharity {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.choa.org/"]];
}

- (void) showWebsite {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.judsongolf.com"]];
}

@end
