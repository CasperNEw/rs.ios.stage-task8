#import "RSTreeView.h"

@implementation RSTreeView

- (instancetype)initWithFrame:(CGRect)frame {
    _stop = NO;
    _stop1 = NO;
    _stop2 = NO;
    _headLayers0 = @[].mutableCopy;
    _headLayers1 = @[].mutableCopy;
    _headLayers2 = @[].mutableCopy;
    return [super initWithFrame:frame];
}

- (void)drawRect:(CGRect)rect {
    if (!self.interval)
        self.interval = 1;
    if (self.colors.count == 0)
    {
        UIColor *black = [UIColor blackColor];
        self.colors = @[black, black, black];
    }
    NSMutableArray<UIColor *> *randoms = self.colors.mutableCopy;
    NSUInteger count = [self.colors count];
    for (NSUInteger i = 0; i < count; i++)
    {
        NSInteger elements = count - i;
        NSInteger n = (arc4random() % elements) + i;
        [randoms exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    self.colors = randoms.copy;
    if (!self.noDraw)
    {
        UIBezierPath *path0 = [self drawFirstStrokeWithPath];
        UIBezierPath *path1 = [self drawSecondStrokeWithPath];
        UIBezierPath *path2 = [self drawThirdStrokeWithPath];
        [self drawPath0:path0 path1:path1 andPath2:path2];
    }
}

- (void)createPath:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval:i
                                                 target:self
                                               selector:@selector(addSublayerToCanvas)
                                               userInfo:nil repeats:YES];
}

- (void)createPath1:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
    [self.time1 invalidate];
    self.time1 = nil;
    self.time1 = [NSTimer scheduledTimerWithTimeInterval:i
                                                  target:self
                                                selector:@selector(addSublayerToCanvas1)
                                                userInfo:nil repeats:YES];
}

- (void)createPath2:(UIBezierPath *)path withInterval:(float)i andColor:(UIColor *)color {
    [self.time2 invalidate];
    self.time2 = nil;
    self.time2 = [NSTimer scheduledTimerWithTimeInterval:i
                                                  target:self
                                                selector:@selector(addSublayerToCanvas2)
                                                userInfo:nil repeats:YES];
}

- (void)addSublayerToCanvas {
    if (self.headLayers0.count > 0)
    {
        [self.layer addSublayer:self.headLayers0[0]];
        [self.headLayers0 removeObjectAtIndex:0];
        NSLog(@"timer...0");
    }
    else
    {
        [self.time invalidate];
        self.time = nil;
        NSLog(@"STOP0");
        self.stop = YES;
        if (!self.time1 && !self.time2 && !self.time)
            [self.delegate isReady:YES];
    }
}

- (void)addSublayerToCanvas1 {
    if (self.headLayers1.count > 0)
    {
        [self.layer addSublayer:self.headLayers1[0]];
        [self.headLayers1 removeObjectAtIndex:0];
        NSLog(@"timer...1");
    }
    else
    {
        [self.time1 invalidate];
        self.time1 = nil;
        self.stop1 = YES;
        NSLog(@"STOP1");
        if (!self.time1 && !self.time2 && !self.time)
            [self.delegate isReady:YES];
    }
}

- (void)addSublayerToCanvas2 {
    if (self.headLayers2.count > 0)
    {
        [self.layer addSublayer:self.headLayers2[0]];
        [self.headLayers2 removeObjectAtIndex:0];
        NSLog(@"timer...2");
    }
    else
    {
        [self.time2 invalidate];
        self.time2 = nil;
        self.stop2 = YES;
        NSLog(@"STOP2");
        if (!self.time1 && !self.time2 && !self.time)
            [self.delegate isReady:YES];
    }
}

- (CAShapeLayer*)createLayerWithPath:(UIBezierPath *)path color:(UIColor *)color andWidth:(NSInteger)w {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = color.CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = w;
    layer.lineJoin = kCALineJoinRound;
    layer.lineCap = kCALineCapRound;
    layer.path = path.CGPath;
    layer.opacity = 1;
    return layer;
}

- (UIBezierPath *)drawFirstStrokeWithPath {
    UIBezierPath *path0 = [UIBezierPath bezierPath];
    float width = 217;
    float height = 144;
    [path0 moveToPoint:CGPointMake(0.78765*width + 43, 0.36425*height + 14)];
    [path0 addCurveToPoint:CGPointMake(0.80645*width + 43, 0.29514*height + 14) controlPoint1:CGPointMake(0.79933*width + 43, 0.34565*height + 14) controlPoint2:CGPointMake(0.80645*width + 43, 0.32155*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.72581*width + 43, 0.1875*height + 14) controlPoint1:CGPointMake(0.80645*width + 43, 0.23488*height + 14) controlPoint2:CGPointMake(0.76977*width + 43, 0.1875*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.70379*width + 43, 0.19156*height + 14) controlPoint1:CGPointMake(0.71818*width + 43, 0.1875*height + 14) controlPoint2:CGPointMake(0.7108*width + 43, 0.18891*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.62903*width + 43, 0.09722*height + 14) controlPoint1:CGPointMake(0.70674*width + 43, 0.1409*height + 14) controlPoint2:CGPointMake(0.67128*width + 43, 0.09722*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.59061*width + 43, 0.11019*height + 14) controlPoint1:CGPointMake(0.61515*width + 43, 0.09722*height + 14) controlPoint2:CGPointMake(0.60206*width + 43, 0.10191*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.54147*width + 43, 0.08333*height + 14) controlPoint1:CGPointMake(0.58115*width + 43, 0.09376*height + 14) controlPoint2:CGPointMake(0.56219*width + 43, 0.08333*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.51946*width + 43, 0.08739*height + 14) controlPoint1:CGPointMake(0.53385*width + 43, 0.08333*height + 14) controlPoint2:CGPointMake(0.52647*width + 43, 0.08475*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.4447*width + 43, -0.00694*height + 14) controlPoint1:CGPointMake(0.52241*width + 43, 0.03674*height + 14) controlPoint2:CGPointMake(0.48694*width + 43, -0.00694*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.37686*width + 43, 0.04246*height + 14) controlPoint1:CGPointMake(0.41638*width + 43, -0.00694*height + 14) controlPoint2:CGPointMake(0.39129*width + 43, 0.01256*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.35714*width + 43, 0.03472*height + 14) controlPoint1:CGPointMake(0.37405*width + 43, 0.03652*height + 14) controlPoint2:CGPointMake(0.36575*width + 43, 0.03472*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.30998*width + 43, 0.05502*height + 14) controlPoint1:CGPointMake(0.33958*width + 43, 0.03472*height + 14) controlPoint2:CGPointMake(0.32328*width + 43, 0.04222*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.28802*width + 43, 0.04861*height + 14) controlPoint1:CGPointMake(0.30568*width + 43, 0.05058*height + 14) controlPoint2:CGPointMake(0.29702*width + 43, 0.04861*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.22018*width + 43, 0.09801*height + 14) controlPoint1:CGPointMake(0.2597*width + 43, 0.04861*height + 14) controlPoint2:CGPointMake(0.2346*width + 43, 0.06812*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.20046*width + 43, 0.09028*height + 14) controlPoint1:CGPointMake(0.21737*width + 43, 0.09208*height + 14) controlPoint2:CGPointMake(0.20907*width + 43, 0.09028*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.11982*width + 43, 0.19792*height + 14) controlPoint1:CGPointMake(0.1565*width + 43, 0.09028*height + 14) controlPoint2:CGPointMake(0.11982*width + 43, 0.13765*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.11418*width + 43, 0.20913*height + 14) controlPoint1:CGPointMake(0.11864*width + 43, 0.20059*height + 14) controlPoint2:CGPointMake(0.1163*width + 43, 0.20475*height + 14)];
    [path0 addCurveToPoint:CGPointMake(0.09447*width + 43, 0.20139*height + 14) controlPoint1:CGPointMake(0.11138*width + 43, 0.20319*height + 14) controlPoint2:CGPointMake(0.10308*width + 43, 0.20139*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.01382*width + 43, 0.30903*height + 14) controlPoint1:CGPointMake(0.05051*width + 43, 0.20139*height + 14) controlPoint2:CGPointMake(0.01382*width + 43, 0.24876*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.02168*width + 43, 0.35543*height + 14) controlPoint1:CGPointMake(0.01382*width + 43, 0.32566*height + 14) controlPoint2:CGPointMake(0.01665*width + 43, 0.3414*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.00922*width + 43, 0.40625*height + 14) controlPoint1:CGPointMake(0.01394*width + 43, 0.36477*height + 14) controlPoint2:CGPointMake(0.00922*width + 43, 0.38475*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.01514*width + 43, 0.44682*height + 14) controlPoint1:CGPointMake(0.00922*width + 43, 0.42061*height + 14) controlPoint2:CGPointMake(0.01132*width + 43, 0.43431*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(-0.00461*width + 43, 0.60069*height + 14) controlPoint1:CGPointMake(0.00011*width + 43, 0.55922*height + 14) controlPoint2:CGPointMake(-0.00461*width + 43, 0.5792*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.07604*width + 43, 0.70833*height + 14) controlPoint1:CGPointMake(-0.00461*width + 43, 0.66096*height + 14) controlPoint2:CGPointMake(0.03208*width + 43, 0.70833*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.08659*width + 43, 0.70742*height + 14) controlPoint1:CGPointMake(0.07961*width + 43, 0.70833*height + 14) controlPoint2:CGPointMake(0.08314*width + 43, 0.70802*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.15438*width + 43, 0.76389*height + 14) controlPoint1:CGPointMake(0.0953*width + 43, 0.73972*height + 14) controlPoint2:CGPointMake(0.12286*width + 43, 0.76389*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.19254*width + 43, 0.7511*height + 14) controlPoint1:CGPointMake(0.16816*width + 43, 0.76389*height + 14) controlPoint2:CGPointMake(0.18116*width + 43, 0.75927*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.26037*width + 43, 0.8125*height + 14) controlPoint1:CGPointMake(0.19896*width + 43, 0.78624*height + 14) controlPoint2:CGPointMake(0.22753*width + 43, 0.8125*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.27093*width + 43, 0.81158*height + 14) controlPoint1:CGPointMake(0.26395*width + 43, 0.8125*height + 14) controlPoint2:CGPointMake(0.26747*width + 43, 0.81219*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.33871*width + 43, 0.86806*height + 14) controlPoint1:CGPointMake(0.27963*width + 43, 0.84388*height + 14) controlPoint2:CGPointMake(0.30719*width + 43, 0.86806*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.38004*width + 43, 0.85287*height + 14) controlPoint1:CGPointMake(0.35379*width + 43, 0.86806*height + 14) controlPoint2:CGPointMake(0.36793*width + 43, 0.86253*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.45853*width + 43, 0.90278*height + 14) controlPoint1:CGPointMake(0.4108*width + 43, 0.88741*height + 14) controlPoint2:CGPointMake(0.43338*width + 43, 0.90278*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.49669*width + 43, 0.88999*height + 14) controlPoint1:CGPointMake(0.47231*width + 43, 0.90278*height + 14) controlPoint2:CGPointMake(0.48531*width + 43, 0.89816*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.56452*width + 43, 0.95139*height + 14) controlPoint1:CGPointMake(0.50311*width + 43, 0.92512*height + 14) controlPoint2:CGPointMake(0.53167*width + 43, 0.95139*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.57507*width + 43, 0.95047*height + 14) controlPoint1:CGPointMake(0.56809*width + 43, 0.95139*height + 14) controlPoint2:CGPointMake(0.57162*width + 43, 0.95108*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.64286*width + 43, 1.00694*height + 14) controlPoint1:CGPointMake(0.58378*width + 43, 0.98277*height + 14) controlPoint2:CGPointMake(0.61134*width + 43, 1.00694*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.68418*width + 43, 0.99176*height + 14) controlPoint1:CGPointMake(0.65793*width + 43, 1.00694*height + 14) controlPoint2:CGPointMake(0.67207*width + 43, 1.00142*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.7212*width + 43, 1.00694*height + 14) controlPoint1:CGPointMake(0.69198*width + 43, 1.00142*height + 14) controlPoint2:CGPointMake(0.70612*width + 43, 1.00694*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.80184*width + 43, 0.89931*height + 14) controlPoint1:CGPointMake(0.76516*width + 43, 1.00694*height + 14) controlPoint2:CGPointMake(0.80184*width + 43, 0.95957*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.80179*width + 43, 0.89551*height + 14) controlPoint1:CGPointMake(0.80184*width + 43, 0.89803*height + 14) controlPoint2:CGPointMake(0.80182*width + 43, 0.89677*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.79954*width + 43, 0.90278*height + 14) controlPoint1:CGPointMake(0.79789*width + 43, 0.90276*height + 14) controlPoint2:CGPointMake(0.79871*width + 43, 0.90278*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.84087*width + 43, 0.8876*height + 14) controlPoint1:CGPointMake(0.81461*width + 43, 0.90278*height + 14) controlPoint2:CGPointMake(0.82876*width + 43, 0.89726*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.87788*width + 43, 0.90278*height + 14) controlPoint1:CGPointMake(0.84866*width + 43, 0.89726*height + 14) controlPoint2:CGPointMake(0.86281*width + 43, 0.90278*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.95853*width + 43, 0.79514*height + 14) controlPoint1:CGPointMake(0.92184*width + 43, 0.90278*height + 14) controlPoint2:CGPointMake(0.95853*width + 43, 0.8554*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.95684*width + 43, 0.77315*height + 14) controlPoint1:CGPointMake(0.95853*width + 43, 0.78761*height + 14) controlPoint2:CGPointMake(0.95794*width + 43, 0.78025*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.99078*width + 43, 0.69097*height + 14) controlPoint1:CGPointMake(0.97626*width + 43, 0.76162*height + 14) controlPoint2:CGPointMake(0.99078*width + 43, 0.72874*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.97198*width + 43, 0.62186*height + 14) controlPoint1:CGPointMake(0.99078*width + 43, 0.66456*height + 14) controlPoint2:CGPointMake(0.98366*width + 43, 0.64047*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(1.00461*width + 43, 0.54514*height + 14) controlPoint1:CGPointMake(0.99124*width + 43, 0.6131*height + 14) controlPoint2:CGPointMake(1.00461*width + 43, 0.58136*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.92396*width + 43, 0.4375*height + 14) controlPoint1:CGPointMake(1.00461*width + 43, 0.48488*height + 14) controlPoint2:CGPointMake(0.96793*width + 43, 0.4375*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.90194*width + 43, 0.44156*height + 14) controlPoint1:CGPointMake(0.91634*width + 43, 0.4375*height + 14) controlPoint2:CGPointMake(0.90895*width + 43, 0.43891*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.82719*width + 43, 0.34722*height + 14) controlPoint1:CGPointMake(0.9049*width + 43, 0.3909*height + 14) controlPoint2:CGPointMake(0.86943*width + 43, 0.34722*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.78877*width + 43, 0.36019*height + 14) controlPoint1:CGPointMake(0.8133*width + 43, 0.34722*height + 14) controlPoint2:CGPointMake(0.80021*width + 43, 0.35191*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.78678*width + 43, 0.35362*height + 14) controlPoint1:CGPointMake(0.79146*width + 43, 0.35839*height + 14) controlPoint2:CGPointMake(0.78917*width + 43, 0.35592*height + 14)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 143.5;
    float height = 115.5;
    [path1 moveToPoint:CGPointMake(0.0069*width + 82, 0.94444*height + 140.5)];
    [path1 addCurveToPoint:CGPointMake(0.43103*width + 82, 0.40598*height + 140.5) controlPoint1:CGPointMake(0.14368*width + 82, 0.89459*height + 140.5) controlPoint2:CGPointMake(0.42*width + 82, 0.71709*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.36207*width + 82, 0.00427*height + 140.5) controlPoint1:CGPointMake(0.44207*width + 82, 0.09487*height + 140.5) controlPoint2:CGPointMake(0.38966*width + 82, 0.00855*height + 140.5)];
    [path1 moveToPoint:CGPointMake(0.99655*width + 82, 0.99145*height + 140.5)];
    [path1 addCurveToPoint:CGPointMake(0.62759*width + 82, 0.74359*height + 140.5) controlPoint1:CGPointMake(0.87012*width + 82, 0.98291*height + 140.5) controlPoint2:CGPointMake(0.61931*width + 82, 0.92137*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.70345*width + 82, 0.24359*height + 140.5) controlPoint1:CGPointMake(0.63586*width + 82, 0.56581*height + 140.5) controlPoint2:CGPointMake(0.68161*width + 82, 0.33618*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addCurveToPoint:CGPointMake(0.76897*width + 82, 0.14103*height + 140.5) controlPoint1:CGPointMake(0.71839*width + 82, 0.20655*height + 140.5) controlPoint2:CGPointMake(0.75241*width + 82, 0.13419*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.53448*width + 82, 0.21368*height + 140.5)];
    [path1 addCurveToPoint:CGPointMake(0.48276*width + 82, 0.63248*height + 140.5) controlPoint1:CGPointMake(0.52414*width + 82, 0.34331*height + 140.5) controlPoint2:CGPointMake(0.49931*width + 82, 0.60855*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.56897*width + 82, 0.85043*height + 140.5)];
    [path1 addCurveToPoint:CGPointMake(0.60345*width + 82, 0.24359*height + 140.5) controlPoint1:CGPointMake(0.56897*width + 82, 0.78205*height + 140.5) controlPoint2:CGPointMake(0.56207*width + 82, 0.36752*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.44138*width + 82, 0.57692*height + 140.5)];
    [path1 addCurveToPoint:CGPointMake(0.3*width + 82, 0.82479*height + 140.5) controlPoint1:CGPointMake(0.35172*width + 82, 0.73932*height + 140.5) controlPoint2:CGPointMake(0.34138*width + 82, 0.77778*height + 140.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 202;
    float height = 19.17;
    [path2 moveToPoint:CGPointMake(0.29803*width + 39.5, 0.35714*height + 236.83)];
    [path2 addCurveToPoint:CGPointMake(0.133*width + 39.5, 0.61006*height + 236.83) controlPoint1:CGPointMake(0.25862*width + 39.5, -0.04762*height + 236.83) controlPoint2:CGPointMake(0.18424*width + 39.5, -0.01851*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.00246*width + 39.5, 0.90476*height + 236.83)];
    [path2 addCurveToPoint:CGPointMake(0.12069*width + 39.5, 0.57143*height + 236.83) controlPoint1:CGPointMake(0.01888*width + 39.5, 0.72222*height + 236.83) controlPoint2:CGPointMake(0.06552*width + 39.5, 0.4*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.17241*width + 39.5, 0.7619*height + 236.83) controlPoint1:CGPointMake(0.17586*width + 39.5, 0.74286*height + 236.83) controlPoint2:CGPointMake(0.17816*width + 39.5, 0.76984*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.68473*width + 39.5, 0.21429*height + 236.83)];
    [path2 addCurveToPoint:CGPointMake(0.80049*width + 39.5, 0.21429*height + 236.83) controlPoint1:CGPointMake(0.70936*width + 39.5, 0.08236*height + 236.83) controlPoint2:CGPointMake(0.767*width + 39.5, -0.10234*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.82632*width + 39.5, 0.5*height + 236.83) controlPoint1:CGPointMake(0.8117*width + 39.5, 0.32026*height + 236.83) controlPoint2:CGPointMake(0.8201*width + 39.5, 0.41631*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.84236*width + 39.5, 0.83333*height + 236.83)];
    [path2 addCurveToPoint:CGPointMake(0.82632*width + 39.5, 0.5*height + 236.83) controlPoint1:CGPointMake(0.84236*width + 39.5, 0.78382*height + 236.83) controlPoint2:CGPointMake(0.83866*width + 39.5, 0.66633*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.82632*width + 39.5, 0.5*height + 236.83)];
    [path2 addCurveToPoint:CGPointMake(0.99754*width + 39.5, 0.57143*height + 236.83) controlPoint1:CGPointMake(0.88339*width + 39.5, 0.34921*height + 236.83) controlPoint2:CGPointMake(0.99754*width + 39.5, 0.15238*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.91379*width + 39.5, 0.95238*height + 236.83) controlPoint1:CGPointMake(0.99754*width + 39.5, 0.99048*height + 236.83) controlPoint2:CGPointMake(0.92036*width + 39.5, 0.9127*height + 236.83)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    return path2;
}


- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
    [self createPath:path0 withInterval:self.interval / 75 andColor:self.colors[0]];
    [self createPath1:path1 withInterval:self.interval / 75 andColor:self.colors[1]];
    [self createPath2:path2 withInterval:self.interval / 75 andColor:self.colors[2]];
}

@end
