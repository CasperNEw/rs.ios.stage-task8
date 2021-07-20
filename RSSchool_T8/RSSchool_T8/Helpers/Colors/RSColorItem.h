#import "RSColorType.h"
@import UIKit;

NS_ASSUME_NONNULL_BEGIN


@interface RSColorItem: NSObject

+ (UIColor *)generateColor:(RSColorType)type;
+ (UIColor *)colorFromHexCode:(NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
