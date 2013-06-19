#import "JCEventDetailsViewController.h"
#import "MFSideMenu.h"

@interface JCEventDetailsViewController ()

@end

@implementation JCEventDetailsViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
	
	switch (indexPath.section) {
		case 0:
			switch (indexPath.row) {
				case 0:
				{
					NSDateComponents *startComponents = [[NSDateComponents alloc] init];
					[startComponents setDay:12];
					[startComponents setMonth:7];
					[startComponents setYear:2013];
					NSDate *startDate = [[NSCalendar currentCalendar] dateFromComponents:startComponents];
					
					NSDateComponents *endComponents = [[NSDateComponents alloc] init];
					[endComponents setDay:15];
					[endComponents setMonth:7];
					[endComponents setYear:2013];
					NSDate *endDate = [[NSCalendar currentCalendar] dateFromComponents:endComponents];
					
					[self promptToAddEventToCalendarWithTitle:@"Judson Collegiate Invitational" startDate:startDate endDate:endDate allDay:YES];
					
					break;
				}
				default:
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
					[self showMap];
					break;
				default:
					break;
			}
			break;
		case 2:
			switch (indexPath.row) {
				case 0:
					[self showCharity];
					break;
				default:
					break;
			}
			break;
		case 3:
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

- (void) showMap {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.apple.com/?q=Country+Club+of+Roswell+2500+Club+Springs+Drive+Roswell,+GA+30076"]];
}

@end
