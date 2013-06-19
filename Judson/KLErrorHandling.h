#import "KLAppConstants.h"

#define PostNSError(__error) NSLog(@"Error: %@", __error); \
    [[NSNotificationCenter defaultCenter] \
    postNotificationName:KL_NOTIFICATION_ERROR \
    object:__error \
    userInfo:__error.userInfo]

#define KL_NOTIFICATION_ERROR_DOMAIN @"KORTLIST"

typedef NS_ENUM (NSInteger, KLErrorCode) {
	KLErrorCodeTwitterAccountNotSetup = 2001,
	KLErrorCodeTwitterAccountAccessDenied = 2002,
	KLErrorCodeUnknown = 2003,
	KLErrorCodeInvalidLogin = 2004,
};

#define ThrowKortlistError(errorCode, errorDescription) \
	NSError *error = [NSError errorWithDomain:KL_NOTIFICATION_ERROR_DOMAIN code:errorCode userInfo:@{NSLocalizedDescriptionKey : errorDescription}]; \
	PostNSError(error);

#define KLHTTPStatusCodeKey @"KLHTTPStatusCodeKey"

@interface KLErrorHandling : NSObject

@end