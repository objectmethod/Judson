#import "UIApplication+DocumentsDirectory.h"

@implementation UIApplication (DocumentsDirectory)

+ (NSString *)documentsDirectoryPath {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return path;
}

+ (NSURL *)documentsDirectoryURL {
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    return url;
}

@end
