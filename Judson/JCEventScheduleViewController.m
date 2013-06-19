#import "JCEventScheduleViewController.h"

@interface JCEventScheduleViewController ()

@end

@implementation JCEventScheduleViewController

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
					[startComponents setHour:11];
					[startComponents setMinute:0];
					NSDate *startDate = [[NSCalendar currentCalendar] dateFromComponents:startComponents];
					
					NSDateComponents *endComponents = [[NSDateComponents alloc] init];
					[endComponents setDay:12];
					[endComponents setMonth:7];
					[endComponents setYear:2013];
					[endComponents setHour:17];
					[endComponents setMinute:0];
					NSDate *endDate = [[NSCalendar currentCalendar] dateFromComponents:endComponents];
					
					[self promptToAddEventToCalendarWithTitle:@"Legends Pro-College-Am,18 Holes" startDate:startDate endDate:endDate allDay:NO];
					
					break;
				}
				default:
					break;
			}
			break;
		case 1:
			switch (indexPath.row) {
				case 0:
				{
					NSDateComponents *startComponents = [[NSDateComponents alloc] init];
					[startComponents setDay:13];
					[startComponents setMonth:7];
					[startComponents setYear:2013];
					[startComponents setHour:8];
					[startComponents setMinute:0];
					NSDate *startDate = [[NSCalendar currentCalendar] dateFromComponents:startComponents];
					
					NSDateComponents *endComponents = [[NSDateComponents alloc] init];
					[endComponents setDay:13];
					[endComponents setMonth:7];
					[endComponents setYear:2013];
					[endComponents setHour:14];
					[endComponents setMinute:0];
					NSDate *endDate = [[NSCalendar currentCalendar] dateFromComponents:endComponents];
					
					[self promptToAddEventToCalendarWithTitle:@"Legends Pro-College Stroke & Best Ball Challenge" startDate:startDate endDate:endDate allDay:NO];
					
					break;
				}
				default:
					break;
			}
			break;
		case 2:
			switch (indexPath.row) {
				case 0:
				{
					NSDateComponents *startComponents = [[NSDateComponents alloc] init];
					[startComponents setDay:14];
					[startComponents setMonth:7];
					[startComponents setYear:2013];
					[startComponents setHour:7];
					[startComponents setMinute:30];
					NSDate *startDate = [[NSCalendar currentCalendar] dateFromComponents:startComponents];
					
					NSDateComponents *endComponents = [[NSDateComponents alloc] init];
					[endComponents setDay:14];
					[endComponents setMonth:7];
					[endComponents setYear:2013];
					[endComponents setHour:13];
					[endComponents setMinute:30];
					NSDate *endDate = [[NSCalendar currentCalendar] dateFromComponents:endComponents];
					
					[self promptToAddEventToCalendarWithTitle:@"Collegiate Stroke Play Second Round" startDate:startDate endDate:endDate allDay:NO];
					
					break;
				}
				default:
					break;
			}
			break;
		case 3:
			switch (indexPath.row) {
				case 0:
				{
					NSDateComponents *startComponents = [[NSDateComponents alloc] init];
					[startComponents setDay:15];
					[startComponents setMonth:7];
					[startComponents setYear:2013];
					[startComponents setHour:7];
					[startComponents setMinute:30];
					NSDate *startDate = [[NSCalendar currentCalendar] dateFromComponents:startComponents];
					
					NSDateComponents *endComponents = [[NSDateComponents alloc] init];
					[endComponents setDay:15];
					[endComponents setMonth:7];
					[endComponents setYear:2013];
					[endComponents setHour:13];
					[endComponents setMinute:30];
					NSDate *endDate = [[NSCalendar currentCalendar] dateFromComponents:endComponents];
					
					[self promptToAddEventToCalendarWithTitle:@"Collegiate Stroke Play Final Round" startDate:startDate endDate:endDate allDay:NO];
					
					break;
				}
				default:
					break;
			}
			break;
		default:
			break;
	}
}

@end
