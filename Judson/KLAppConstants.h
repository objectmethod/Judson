#import "DDLog.h"

static const int ddLogLevel = LOG_LEVEL_VERBOSE;

@interface KLAppConstants : NSObject

extern NSString * const KL_NOTIFICATION_ERROR;

extern NSString * const KLNotificationOpenFeedbackView;
extern NSString * const KLNotificationUserCreated;
extern NSString * const KLNotificationUserAuthenticationChanged;
extern NSString * const KLSegueIdentifierShowAddPlace;

@end
