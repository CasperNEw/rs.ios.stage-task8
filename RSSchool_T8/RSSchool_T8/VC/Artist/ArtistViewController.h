#import <UIKit/UIKit.h>
#import "RSState.h"
#import "RSPaletteVCDelegate.h"
#import "RSDrawStateDelegate.h"
#import "RSSchool_T8-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface ArtistViewController : UIViewController <RSPaletteVCDelegate,
                                                    RSDrawStateDelegate,
                                                        RSTimerDelegate,
                                                    RSDrawOnCanvasDelegate>

@property (weak) NSTimer *time;
@property (nonatomic) RSState state;

@end

NS_ASSUME_NONNULL_END
