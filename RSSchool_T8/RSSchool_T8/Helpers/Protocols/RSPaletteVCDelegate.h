#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RSPaletteVCDelegate <NSObject>
- (void)passChoosenColors:(NSArray<UIColor*>*)theValue;
@end

NS_ASSUME_NONNULL_END
