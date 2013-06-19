@interface NSString (Formatting)

+ (NSString*) percentageFromFloat:(float)value;
+ (NSString*) fileSizeFromInt:(int)value;
+ (NSString *)formatValue:(int)value forDigits:(int)zeros;

@end
