#import <UIKit/UIKit.h>
#import "RSPaletteVCDelegate.h"
NS_ASSUME_NONNULL_BEGIN
@class RSUIButton;
@interface RSPalletVC : UIViewController
@property (weak, nonatomic) IBOutlet UIView *topRowView;
@property (weak, nonatomic) IBOutlet UIView *downRowView;
@property (weak, nonatomic) IBOutlet RSUIButton *save;
@property (nonatomic) NSMutableArray<NSNumber *> *arr;
@property (nonatomic, weak) id <RSPaletteVCDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
