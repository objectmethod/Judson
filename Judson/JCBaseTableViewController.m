#import "JCBaseTableViewController.h"
#import "MFSideMenu.h"

@interface JCBaseTableViewController ()

- (IBAction)menuButtonClicked:(id)sender;

@end

@implementation JCBaseTableViewController

- (IBAction)menuButtonClicked:(id)sender {
	[self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (MFSideMenuContainerViewController *)menuContainerViewController {
    return (MFSideMenuContainerViewController *)self.navigationController.parentViewController;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
