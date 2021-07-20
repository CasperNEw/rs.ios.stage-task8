#import "RSUIButton.h"

@implementation RSUIButton

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    [self makeButtonUI];
    return self;
}

- (void)makeButtonUI {
    self.backgroundColor = [UIColor whiteColor];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    self.titleLabel.tintColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1];
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:self.layer.bounds cornerRadius:10];
    self.layer.shadowPath = shadowPath0.CGPath;
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 1;
    self.layer.shadowRadius = 1;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = NO;
    [self setTitleColor:[UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1] forState:UIControlStateHighlighted];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.state == UIControlStateHighlighted)
    {
        [self setHighlighted:NO];
    }
    self.layer.shadowColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1].CGColor;
    self.layer.shadowRadius = 2;
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.layer.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.25].CGColor;
    self.layer.shadowRadius = 1;
    [super touchesEnded:touches withEvent:event];
}

@end
