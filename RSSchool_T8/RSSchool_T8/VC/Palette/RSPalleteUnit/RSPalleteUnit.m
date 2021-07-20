#import "RSPalleteUnit.h"

@implementation RSPalleteUnit

- (instancetype)initWithFrame:(CGRect)frame {
    return [super initWithFrame:frame];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIControlStateHighlighted)
        [self setHighlighted:NO];
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = self.layer.sublayers.lastObject.backgroundColor;
    sublayer.frame = CGRectMake(2, 2, 36, 36);
    sublayer.cornerRadius = 8;
    [self.layer.sublayers.lastObject removeFromSuperlayer];
    [self.layer addSublayer:sublayer];
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

@end
