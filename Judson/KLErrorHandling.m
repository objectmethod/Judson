#import "KLErrorHandling.h"
#import "AFJSONRequestOperation.h"

@implementation KLErrorHandling

+ (int)getHttpStatusCodeFromError:(NSError *)error {
	NSHTTPURLResponse *response = [error.userInfo objectForKey:AFNetworkingOperationFailingURLResponseErrorKey]; \
	return response.statusCode;
}

@end