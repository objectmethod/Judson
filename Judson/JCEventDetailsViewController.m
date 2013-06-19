#import "JCEventDetailsViewController.h"
#import "MFSideMenu.h"

@interface JCEventDetailsViewController ()

@property (strong, nonatomic) NSDictionary *event;

@end

@implementation JCEventDetailsViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.event = @{
				@"title" : @"Judson Collegiate Invitational & Legends Tour Atlanta Pro-Am",
	@"location" : @"Country Club of Roswell",
	@"address" : @"2500 Club Springs Drive",
	@"city" : @"Roswell",
	@"state" : @"GA",
	@"zip" : @"30076",
	@"charity_name" : @"Children's Healthcare of Atlanta",
	@"charity_website" : @"http://www.choa.org",
	@"website" : @"http://www.judsongolf.com"};
}

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
	NSString *urlString = [self.event objectForKey:@"charity_website"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (void) showWebsite {
	NSString *urlString = [self.event objectForKey:@"website"];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

- (void) showMap {
	NSString *location = [self.event objectForKey:@"location"];
	NSString *address = [self.event objectForKey:@"address"];
	NSString *city = [self.event objectForKey:@"city"];
	NSString *state = [self.event objectForKey:@"state"];
	NSString *zip = [self.event objectForKey:@"zip"];
	
	NSString *query = [NSString stringWithFormat:@"%@ %@ %@, %@ %@", location, address, city, state, zip];
	
	query = [query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	
	NSString *urlString = [NSString stringWithFormat:@"http://maps.apple.com/?q=%@", query];
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
