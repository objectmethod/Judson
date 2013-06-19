#import "JCEventScheduleViewController.h"

@interface JCEventScheduleViewController ()

@property (strong, nonatomic) NSArray *days;

@end

@implementation JCEventScheduleViewController

- (void) viewDidLoad {
	[super viewDidLoad];
	
	self.days = @[
			   @{
		  @"title" : @"Legends Pro-College-Am, 18 Holes",
	@"startDate" : @{
			@"day" : [NSNumber numberWithInt:12],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:11],
   @"minute" : [NSNumber numberWithInt:0]},
	@"endDate" : @{
			@"day" : [NSNumber numberWithInt:12],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:17],
   @"minute" : [NSNumber numberWithInt:0]}},
	  @{
		  @"title" : @"Legends Pro-College Stroke & Best Ball Challenge",
	@"startDate" : @{
			@"day" : [NSNumber numberWithInt:13],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:8],
   @"minute" : [NSNumber numberWithInt:0]},
	@"endDate" : @{
			@"day" : [NSNumber numberWithInt:13],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:14],
   @"minute" : [NSNumber numberWithInt:0]}},
	  @{
		  @"title" : @"Collegiate Stroke Play Second Round",
	@"startDate" : @{
			@"day" : [NSNumber numberWithInt:14],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:7],
   @"minute" : [NSNumber numberWithInt:30]},
	@"endDate" : @{
			@"day" : [NSNumber numberWithInt:14],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:13],
   @"minute" : [NSNumber numberWithInt:30]}},
	  @{
		  @"title" : @"Collegiate Stroke Play Final Round",
	@"startDate" : @{
			@"day" : [NSNumber numberWithInt:15],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:7],
   @"minute" : [NSNumber numberWithInt:30]},
	@"endDate" : @{
			@"day" : [NSNumber numberWithInt:15],
   @"month" : [NSNumber numberWithInt:7],
   @"year" : [NSNumber numberWithInt:2013],
   @"hour" : [NSNumber numberWithInt:13],
   @"minute" : [NSNumber numberWithInt:30]}}
	  ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.days.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"EventCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	NSDictionary *event = [self.days objectAtIndex:indexPath.section];
	
	NSString *eventStartDateString = [self dateStringFromEvent:[event objectForKey:@"startDate"]];
	NSString *eventName = [event objectForKey:@"title"];
	
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = eventStartDateString;
			break;
		case 1:
			cell.textLabel.text = eventName;
			cell.textLabel.font = [UIFont systemFontOfSize:15];
			break;
		default:
			break;
	}
    
    return cell;
}

- (NSString*) dateStringFromEvent:(NSDictionary*)event {
	NSDate *date = [self dateFromEvent:event];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	formatter.dateFormat = @"EEEE MMMM dd, yyyy hh:mm a";
	return [formatter stringFromDate:date];
}

- (NSDate*) dateFromEvent:(NSDictionary*)event {
	NSNumber *day = [event objectForKey:@"day"];
	NSNumber *month = [event objectForKey:@"month"];
	NSNumber *year = [event objectForKey:@"year"];
	NSNumber *hour = [event objectForKey:@"hour"];
	NSNumber *minute = [event objectForKey:@"minute"];
	
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:day.intValue];
	[components setMonth:month.intValue];
	[components setYear:year.intValue];
	[components setHour:hour.intValue];
	[components setMinute:minute.intValue];
	return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
	
	NSDictionary *event = [self.days objectAtIndex:indexPath.section];
	
	NSDate *startDate = [self dateFromEvent:[event objectForKey:@"startDate"]];
	NSDate *endDate = [self dateFromEvent:[event objectForKey:@"endDate"]];
	NSString *title = [event objectForKey:@"title"];
	BOOL allDay = NO;
	
	[self promptToAddEventToCalendarWithTitle:title startDate:startDate endDate:endDate allDay:allDay];
}

@end
