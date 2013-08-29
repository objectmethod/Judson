#import "JCEventFieldViewController.h"

@interface JCEventFieldViewController ()

@property (strong, nonatomic) NSDictionary *field;

@end

@implementation JCEventFieldViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.field = @{  @"Amy Alcott" :  @"http://r20.rs6.net/tn.jsp?e=0013RjCTHg1Drot_L156y2S7B36NDyWWPdpKSXDWPiyYOsC_a-2NoPWwHvCBFW2rFbe9uSMWD4XDuT0D37O31pgpITQtH4QE1dvSYX0SP6cNiCiXxgiji8913FoLy8EALfHJFIRzT47qtKbh85irxSbzFWI1-rbVKHvLdJznIBu28btjTRl92hwHg==",
							  @"Christa Johnston" :  @"http://players.thelegendstour.com/details.php?name=J&amp;PID=53",
							  @"Patti Rizzo" :  @"http://players.thelegendstour.com/details.php?name=R&amp;PID=139",
							  @"Danielle Ammaccapane" :  @"http://players.thelegendstour.com/details.php?name=A&amp;PID=192",
							  @"Rosie Jones" :  @"http://players.thelegendstour.com/details.php?name=J&amp;PID=144",
							  @"Cindy Schreyer" :  @"http://players.thelegendstour.com/details.php?name=S&amp;PID=167",
							  @"Luciana Bemvenuti" : @"",
							  @"Betsy King" :  @"http://r20.rs6.net/tn.jsp?e=0013RjCTHg1Drot_L156y2S7B36NDyWWPdpKSXDWPiyYOsC_a-2NoPWwHvCBFW2rFbe9uSMWD4XDuT0D37O31pgpITQtH4QE1dvSYX0SP6cNiCiXxgiji8913FoLy8EALfHJFIRzT47qtKbh85irxSbzBHayDW-DBofNYLBMKq0Ck4zq5JznjZSug==",
							  @"Nancy Scranton" :  @"http://players.thelegendstour.com/details.php?name=S&amp;PID=141",
							  @"Jane Blalock" :  @"http://players.thelegendstour.com/details.php?name=B&amp;PID=6",
							  @"Jenny Lidback" :  @"http://players.thelegendstour.com/details.php?name=L&amp;PID=166",
							  @"Val Skinner" :  @"http://players.thelegendstour.com/details.php?name=S&amp;PID=137",
							  @"Nanci Bowen" : @"",
							  @"Nancy Lopez" :  @"http://r20.rs6.net/tn.jsp?e=0013RjCTHg1Drot_L156y2S7B36NDyWWPdpKSXDWPiyYOsC_a-2NoPWwHvCBFW2rFbe9uSMWD4XDuT0D37O31pgpITQtH4QE1dvSYX0SP6cNiCiXxgiji8913FoLy8EALfHJFIRzT47qtKbh85irxSbzMxkQ1Cc2m7C4EoL0HAxUgxdW7umynXRKQ==",
							  @"Sherri Steinhauer" :  @"http://players.thelegendstour.com/details.php?name=S&amp;PID=176",
							  @"Pat Bradley" :  @"http://players.thelegendstour.com/details.php?name=B&amp;PID=7",
							  @"Barb Moxness" :  @"http://players.thelegendstour.com/details.php?name=M&amp;PID=21",
							  @"Jan Stephenson" :  @"http://players.thelegendstour.com/details.php?name=S&amp;PID=33",
							  @"Donna Caponi" :  @"http://players.thelegendstour.com/details.php?name=C&amp;PID=92",
							  @"Barb Mucha" :  @"http://players.thelegendstour.com/details.php?name=M&amp;PID=142",
							  @"Kris Tschetter" :  @"http://players.thelegendstour.com/details.php?name=T&amp;PID=177",
							  @"Dawn Coe-Jones" :  @"http://players.thelegendstour.com/details.php?name=C&amp;PID=94",
							  @"Liselotte Neumann" :  @"http://players.thelegendstour.com/details.php?name=N&amp;PID=187",
							  @"Sherri Turner" :  @"http://players.thelegendstour.com/details.php?name=T&amp;PID=47",
							  @"Elaine Crosby" :  @"http://players.thelegendstour.com/details.php?name=C&amp;PID=10",
							  @"Cindy Rarick" :  @"http://players.thelegendstour.com/details.php?name=R&amp;PID=82",
							  @"Lori West" :  @"http://players.thelegendstour.com/details.php?name=W&amp;PID=35",
							  @"Alicia Dibos" :  @"http://players.thelegendstour.com/details.php?name=D&amp;PID=100",
							  @"Laurie Rinker" :  @"http://players.thelegendstour.com/details.php?name=R&amp;PID=158",
							  @"Kathy Whitworth" :  @"http://players.thelegendstour.com/details.php?name=W&amp;PID=52",
							  @"Cindy Figg-Currier" :  @"http://players.thelegendstour.com/details.php?name=F&amp;PID=138",};
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.field.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"FieldCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	NSString *urlString = [self.field objectForKey:[self.field.allKeys objectAtIndex:indexPath.row]];
	
	if (![urlString isEqualToString:@""]) {
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	} else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
    cell.textLabel.text = [self.field.allKeys objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];
	
	NSString *urlString = [self.field objectForKey:[self.field.allKeys objectAtIndex:indexPath.row]];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
}

@end
