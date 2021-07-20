#import <UIKit/UIKit.h>
#import "RSDrawStateDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface RSLandscapeView : UIView
@property (strong, nonatomic) NSMutableArray<CAShapeLayer *> *headLayers0;
@property (strong, nonatomic) NSMutableArray<CAShapeLayer *> *headLayers1;
@property (strong, nonatomic) NSMutableArray<CAShapeLayer *> *headLayers2;
@property (weak, nonatomic) NSTimer *time;
@property (weak, nonatomic) NSTimer *time1;
@property (weak, nonatomic) NSTimer *time2;
@property (strong, nonatomic) NSArray<UIColor *> *colors;
@property (nonatomic) BOOL stop;
@property (nonatomic) BOOL stop1;
@property (nonatomic) BOOL stop2;
@property (nonatomic, weak) id <RSDrawStateDelegate> delegate;
@property (nonatomic) BOOL noDraw;;
@property (nonatomic) float interval;
@end

NS_ASSUME_NONNULL_END
