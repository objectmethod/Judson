#import "JCBaseTableViewController.h"
#import "MFSideMenu.h"
#import <EventKit/EventKit.h>
#import "BlockAlertView.h"

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

- (void) promptToAddEventToCalendarWithTitle:(NSString*)title startDate:(NSDate*)startDate endDate:(NSDate*)endDate allDay:(BOOL)allDay {
	BlockAlertView *alertView = [[BlockAlertView alloc] initWithTitle:@"Add Event?" message:@"Would you like to add this event to your calendar?"];
	
	[alertView setCancelButtonWithTitle:@"No" block:nil];
	[alertView addButtonWithTitle:@"Yes" block:^{
		[self addEventToCalendarWithTitle:title startDate:startDate endDate:endDate allDay:allDay];
	}];
	
	[alertView show];
}

- (void) addEventToCalendarWithTitle:(NSString*)title startDate:(NSDate*)startDate endDate:(NSDate*)endDate allDay:(BOOL)allDay {
	EKEventStore *eventStore = [[EKEventStore alloc] init] ;
	if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
		// iOS 6 and later
		[eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
			if (granted){
				//---- codes here when user allow your app to access theirs' calendar.
				[self performCalendarActivity:eventStore title:title startDate:startDate endDate:endDate allDay:allDay];
			}else
			{
				//----- codes here when user NOT allow your app to access the calendar.
			}
		}];
	}
	else {
		//---- codes here for IOS < 6.0.
		[self performCalendarActivity:eventStore title:title startDate:startDate endDate:endDate allDay:allDay];
	}
}

- (void) performCalendarActivity:(EKEventStore *)eventStore title:(NSString*)title startDate:(NSDate*)startDate endDate:(NSDate*)endDate allDay:(BOOL)allDay {
	//	EKEventStore *eventStore = [[EKEventStore alloc] init];
	
    EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
    event.title     = title;
	
	event.startDate = startDate;
	event.endDate = endDate;
	event.allDay = allDay;
	
	event.location = @"Country Club of Roswell 2500 Club Springs Dr Roswell, GA 30076";
	
    [event setCalendar:[eventStore defaultCalendarForNewEvents]];
    NSError *err;
    [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
	
	if (err) {
		[[[UIAlertView alloc] initWithTitle:@"Error" message:err.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
	}
}

@end
