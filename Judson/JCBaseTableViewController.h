@interface JCBaseTableViewController : UITableViewController

- (void) promptToAddEventToCalendarWithTitle:(NSString*)title startDate:(NSDate*)startDate endDate:(NSDate*)endDate allDay:(BOOL)allDay;

@end
