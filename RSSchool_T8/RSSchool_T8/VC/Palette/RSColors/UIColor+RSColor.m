#import "UIColor+RSColor.h"

@implementation UIColor (RSColor)
+ (id)putUnitColorOfUnitTag:(NSNumber*)t {
    NSArray *colors = @[[self colorWithRed:0.886 green:0.106 blue:0.173 alpha:1],
                        [self colorWithRed:0.243 green:0.09 blue:0.8 alpha:1],
                        [self colorWithRed:0 green:0.486 blue:0.216 alpha:1],
                        [self colorWithRed:0.502 green:0.502 blue:0.502 alpha:1],
                        [self colorWithRed:0.616 green:0.369 blue:0.918 alpha:1],
                        [self colorWithRed:1 green:0.478 blue:0.408 alpha:1],
                        [self colorWithRed:1 green:0.678 blue:0.329 alpha:1],
                        [self colorWithRed:0 green:0.682 blue:0.929 alpha:1],
                        [self colorWithRed:1 green:0.467 blue:0.635 alpha:1],
                        [self colorWithRed:0 green:0.18 blue:0.235 alpha:1],
                        [self colorWithRed:0.055 green:0.216 blue:0.094 alpha:1],
                        [self colorWithRed:0.38 green:0.059 blue:0.063 alpha:1]];
    return colors[t.intValue];
}
@end
