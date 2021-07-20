#import "RSPlanetView.h"

@implementation RSPlanetView
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
    float width = 168;
    float height = 168;
    [path0 moveToPoint:CGPointMake(0.57143*width + 65.5, 0.28443*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.60714*width + 65.5, 0.26647*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.66369*width + 65.5, 0.23353*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.72024*width + 65.5, 0.19162*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.75893*width + 65.5, 0.1497*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.78274*width + 65.5, 0.10778*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.79762*width + 65.5, 0.07186*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.29464*width + 65.5, 0.15569*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.25298*width + 65.5, 0.15269*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.21726*width + 65.5, 0.14072*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.1875*width + 65.5, 0.12275*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.35714*width + 65.5, 0.14671*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.40179*width + 65.5, 0.13473*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.4494*width + 65.5, 0.11976*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.49702*width + 65.5, 0.09281*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.54167*width + 65.5, 0.05988*height + 67.5) controlPoint1:CGPointMake(0.51091*width + 65.5, 0.08283*height + 67.5) controlPoint2:CGPointMake(0.53929*width + 65.5, 0.06228*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.56845*width + 65.5, 0.02994*height + 67.5) controlPoint1:CGPointMake(0.54405*width + 65.5, 0.05749*height + 67.5) controlPoint2:CGPointMake(0.56052*width + 65.5, 0.03892*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.58036*width + 65.5, 0.00299*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.22321*width + 65.5, 0.2485*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.25*width + 65.5, 0.25449*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.29464*width + 65.5, 0.25449*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.34226*width + 65.5, 0.2485*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.38393*width + 65.5, 0.23952*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.43452*width + 65.5, 0.22754*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.25595*width + 65.5, 0.36527*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.27976*width + 65.5, 0.36228*height + 67.5) controlPoint1:CGPointMake(0.25833*width + 65.5, 0.36527*height + 67.5) controlPoint2:CGPointMake(0.27282*width + 65.5, 0.36327*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.30655*width + 65.5, 0.35928*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.33036*width + 65.5, 0.35329*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.20536*width + 65.5, 0.36228*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.16071*width + 65.5, 0.35928*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.11905*width + 65.5, 0.34431*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.08036*width + 65.5, 0.32635*height + 67.5) controlPoint1:CGPointMake(0.10714*width + 65.5, 0.33832*height + 67.5) controlPoint2:CGPointMake(0.08274*width + 65.5, 0.32635*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addCurveToPoint:CGPointMake(0.05357*width + 65.5, 0.31138*height + 67.5) controlPoint1:CGPointMake(0.07798*width + 65.5, 0.32635*height + 67.5) controlPoint2:CGPointMake(0.06151*width + 65.5, 0.31637*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.15774*width + 65.5, 0.59581*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.11012*width + 65.5, 0.58683*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.05655*width + 65.5, 0.56587*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.00298*width + 65.5, 0.53293*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.27679*width + 65.5, 0.59581*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.30952*width + 65.5, 0.59581*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.33631*width + 65.5, 0.59281*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.38988*width + 65.5, 0.58383*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.45238*width + 65.5, 0.56886*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.50893*width + 65.5, 0.55389*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.56548*width + 65.5, 0.53593*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.62202*width + 65.5, 0.51796*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.68155*width + 65.5, 0.49102*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.7381*width + 65.5, 0.46407*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.78571*width + 65.5, 0.43413*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.82143*width + 65.5, 0.41018*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.85417*width + 65.5, 0.38922*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.90476*width + 65.5, 0.34132*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.92857*width + 65.5, 0.31138*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.9494*width + 65.5, 0.27545*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.96726*width + 65.5, 0.23054*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.38988*width + 65.5, 0.46707*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.4375*width + 65.5, 0.45509*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.51488*width + 65.5, 0.43114*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.56548*width + 65.5, 0.41317*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.61905*width + 65.5, 0.38922*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.66369*width + 65.5, 0.36826*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.70238*width + 65.5, 0.34731*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.15774*width + 65.5, 0.7006*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.1994*width + 65.5, 0.70359*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.24405*width + 65.5, 0.70359*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.29167*width + 65.5, 0.6976*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.77679*width + 65.5, 0.55389*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.8125*width + 65.5, 0.54192*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.85714*width + 65.5, 0.51497*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.91071*width + 65.5, 0.47305*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.94643*width + 65.5, 0.44611*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.97024*width + 65.5, 0.41916*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.6369*width + 65.5, 0.87725*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.66369*width + 65.5, 0.87126*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71726*width + 65.5, 0.8503*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.76488*width + 65.5, 0.82934*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.80357*width + 65.5, 0.81138*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.83929*width + 65.5, 0.79341*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.85417*width + 65.5, 0.77545*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.88393*width + 65.5, 0.8503*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.91964*width + 65.5, 0.82934*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.95238*width + 65.5, 0.80539*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.99702*width + 65.5, 0.76048*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.82143*width + 65.5, 0.88623*height + 67.5)];
    [path0 addLineToPoint:CGPointMake(0.77679*width + 65.5, 0.90719*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71429*width + 65.5, 0.93114*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.65476*width + 65.5, 0.9521*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.58929*width + 65.5, 0.97006*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.52679*width + 65.5, 0.98503*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.44345*width + 65.5, 0.99401*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.3631*width + 65.5, 0.99701*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.29464*width + 65.5, 0.99401*height + 67.5)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 256;
    float height = 184;
    [path1 moveToPoint:CGPointMake(0.142*width + 26, 0.5*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.106*width + 26, 0.52247*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.07*width + 26, 0.5618*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.036*width + 26, 0.60674*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.012*width + 26, 0.65169*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.004*width + 26, 0.69663*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.008*width + 26, 0.74157*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.024*width + 26, 0.77809*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.052*width + 26, 0.80899*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.094*width + 26, 0.83427*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.138*width + 26, 0.84831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.184*width + 26, 0.85393*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.228*width + 26, 0.85674*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.254*width + 26, 0.85563*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.142*width + 26, 0.5*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.144*width + 26, 0.46067*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.154*width + 26, 0.39045*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.168*width + 26, 0.33146*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.186*width + 26, 0.26685*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.208*width + 26, 0.2191*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.236*width + 26, 0.16573*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.268*width + 26, 0.1236*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.3*width + 26, 0.0927*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.334*width + 26, 0.06461*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.49*width + 26, 0.00843*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.546*width + 26, 0.01404*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.602*width + 26, 0.02809*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.652*width + 26, 0.05618*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.7*width + 26, 0.09831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.734*width + 26, 0.13764*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.762*width + 26, 0.17697*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.786*width + 26, 0.21629*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.142*width + 26, 0.5*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.142*width + 26, 0.53652*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.146*width + 26, 0.57865*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.786*width + 26, 0.21629*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.822*width + 26, 0.20787*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.87*width + 26, 0.20506*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.916*width + 26, 0.21348*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.958*width + 26, 0.23596*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.986*width + 26, 0.26685*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.996*width + 26, 0.30899*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.994*width + 26, 0.35955*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.98*width + 26, 0.4073*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.938*width + 26, 0.48315*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.904*width + 26, 0.5309*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.852*width + 26, 0.58708*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83867*width + 26, 0.59831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.786*width + 26, 0.21629*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.8*width + 26, 0.24438*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.812*width + 26, 0.2809*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.146*width + 26, 0.57865*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.13*width + 26, 0.5927*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.116*width + 26, 0.61798*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.11*width + 26, 0.64607*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.112*width + 26, 0.67416*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.122*width + 26, 0.69663*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.142*width + 26, 0.71348*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.172*width + 26, 0.73034*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.182*width + 26, 0.73297*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.146*width + 26, 0.57865*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.156*width + 26, 0.6264*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.166*width + 26, 0.67416*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.182*width + 26, 0.73297*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.812*width + 26, 0.2809*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.838*width + 26, 0.2809*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.87*width + 26, 0.29775*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.882*width + 26, 0.32022*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.884*width + 26, 0.35393*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.878*width + 26, 0.38483*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.862*width + 26, 0.41573*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.84733*width + 26, 0.4382*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.812*width + 26, 0.2809*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.824*width + 26, 0.32022*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83867*width + 26, 0.38483*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.84733*width + 26, 0.4382*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.254*width + 26, 0.85563*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.294*width + 26, 0.85393*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.378*width + 26, 0.83989*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.448*width + 26, 0.82022*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.51*width + 26, 0.79775*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.588*width + 26, 0.76404*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.666*width + 26, 0.72191*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.728*width + 26, 0.68258*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.792*width + 26, 0.63764*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83867*width + 26, 0.59831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.254*width + 26, 0.85563*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.274*width + 26, 0.88764*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.306*width + 26, 0.92135*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.342*width + 26, 0.94663*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.378*width + 26, 0.96629*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.422*width + 26, 0.98596*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.472*width + 26, 0.99719*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.52*width + 26, 0.99719*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.564*width + 26, 0.99157*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.602*width + 26, 0.97753*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.632*width + 26, 0.96067*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.67*width + 26, 0.93539*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.7*width + 26, 0.9073*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.724*width + 26, 0.88202*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.756*width + 26, 0.83427*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.788*width + 26, 0.77809*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.81*width + 26, 0.72472*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83*width + 26, 0.6573*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83867*width + 26, 0.59831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.84733*width + 26, 0.4382*height + 66.5)];
    [path1 addLineToPoint:CGPointMake(0.84*width + 26, 0.44944*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.82*width + 26, 0.47753*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.796*width + 26, 0.50281*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.766*width + 26, 0.5309*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.738*width + 26, 0.55618*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.71*width + 26, 0.57865*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.682*width + 26, 0.59831*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.646*width + 26, 0.6236*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.6*width + 26, 0.65169*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.554*width + 26, 0.67416*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.506*width + 26, 0.69382*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.46*width + 26, 0.71067*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.412*width + 26, 0.72472*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.364*width + 26, 0.73596*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.316*width + 26, 0.74157*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.27*width + 26, 0.74438*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.234*width + 26, 0.74157*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.204*width + 26, 0.73876*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.182*width + 26, 0.73297*height + 66.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 239;//+31,5
    float height = 199;//50
    [path2 moveToPoint:CGPointMake(0.91942*width + 31.5, 0.65672*height + 50)];
    [path2 addLineToPoint:CGPointMake(0.94008*width + 31.5, 0.6393*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.96901*width + 31.5, 0.64179*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.9876*width + 31.5, 0.6592*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.9938*width + 31.5, 0.68408*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.98967*width + 31.5, 0.70647*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.97727*width + 31.5, 0.72886*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.95661*width + 31.5, 0.73632*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.93182*width + 31.5, 0.73134*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.91529*width + 31.5, 0.71144*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.90909*width + 31.5, 0.68657*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.91942*width + 31.5, 0.65672*height + 50)];
    [path2 closePath];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.86777*width + 31.5, 0.80597*height + 50)];
    [path2 addLineToPoint:CGPointMake(0.87603*width + 31.5, 0.79602*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.88636*width + 31.5, 0.79602*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.89463*width + 31.5, 0.80348*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.89669*width + 31.5, 0.81592*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.89256*width + 31.5, 0.82587*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.88223*width + 31.5, 0.83085*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.8719*width + 31.5, 0.82836*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.8657*width + 31.5, 0.81841*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.86777*width + 31.5, 0.80597*height + 50)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake(0.18388*width + 31.5, 0.9602*height + 50)];
    [path2 addLineToPoint:CGPointMake(0.19215*width + 31.5, 0.95522*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.20455*width + 31.5, 0.9602*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.21074*width + 31.5, 0.97264*height + 50) controlPoint1:CGPointMake(0.20661*width + 31.5, 0.96352*height + 50) controlPoint2:CGPointMake(0.21074*width + 31.5, 0.97065*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addCurveToPoint:CGPointMake(0.21074*width + 31.5, 0.98756*height + 50) controlPoint1:CGPointMake(0.21074*width + 31.5, 0.97463*height + 50) controlPoint2:CGPointMake(0.21143*width + 31.5, 0.98424*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.20041*width + 31.5, 0.99502*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.18595*width + 31.5, 0.99502*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.17975*width + 31.5, 0.98507*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.17769*width + 31.5, 0.97264*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.18388*width + 31.5, 0.9602*height + 50)];
    [path2 closePath];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.02273*width + 31.5, 0.13682*height + 50)];
    [path2 addCurveToPoint:CGPointMake(0.04752*width + 31.5, 0.11443*height + 50) controlPoint1:CGPointMake(0.0303*width + 31.5, 0.12935*height + 50) controlPoint2:CGPointMake(0.04587*width + 31.5, 0.11443*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.07438*width + 31.5, 0.10945*height + 50)];
    [path2 addLineToPoint:CGPointMake(0.10124*width + 31.5, 0.1194*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.12603*width + 31.5, 0.15423*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.1281*width + 31.5, 0.20149*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.11157*width + 31.5, 0.23881*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.07645*width + 31.5, 0.25871*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.03926*width + 31.5, 0.24876*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.01446*width + 31.5, 0.22637*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.0062*width + 31.5, 0.18159*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.02273*width + 31.5, 0.13682*height + 50)];
    [path2 closePath];
    [path2 moveToPoint:CGPointMake(0.77273*width + 31.5, 0.00995*height + 50)];
    [path2 addCurveToPoint:CGPointMake(0.79545*width + 31.5, 0.00498*height + 50) controlPoint1:CGPointMake(0.77686*width + 31.5, 0.00829*height + 50) controlPoint2:CGPointMake(0.7938*width + 31.5, 0.00498*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.81405*width + 31.5, 0.0199*height + 50)];
    [path2 addLineToPoint:CGPointMake(0.81612*width + 31.5, 0.04478*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.80785*width + 31.5, 0.06468*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.78719*width + 31.5, 0.07214*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.76653*width + 31.5, 0.0597*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.76033*width + 31.5, 0.03234*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.77273*width + 31.5, 0.00995*height + 50)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 closePath];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    return path2;
}

- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
    [self createPath:path0 withInterval:self.interval / 130 andColor:self.colors[0]];
    [self createPath1:path1 withInterval:self.interval / 130 andColor:self.colors[1]];
    [self createPath2:path2 withInterval:self.interval / 130 andColor:self.colors[2]];
}



@end
