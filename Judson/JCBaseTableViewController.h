#import "MFSideMenu.h"

@interface JCBaseTableViewController : UITableViewController

@property (readonly) MFSideMenuContainerViewController *menuContainerViewController;

- (void) promptToAddEventToCalendarWithTitle:(NSString*)title startDate:(NSDate*)startDate endDate:(NSDate*)endDate allDay:(BOOL)allDay;

@end
