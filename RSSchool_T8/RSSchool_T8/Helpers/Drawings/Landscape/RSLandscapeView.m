#import "RSLandscapeView.h"

@implementation RSLandscapeView


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
    float width = 230;
    float height = 107.5;
    [path0 moveToPoint: CGPointMake(0.31818*width + 50, 0.33945*height + 136)];
    [path0 addLineToPoint: CGPointMake(0.32684*width + 50, 0.39908*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint: CGPointMake(0.33117*width + 50, 0.5*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint: CGPointMake(0.32035*width + 50, 0.66972*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint: CGPointMake(0.30519*width + 50, 0.83028*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.30736*width + 50, 0.91743*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.32035*width + 50, 0.99083*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.33983*width + 50, 0.99083*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.34416*width + 50, 0.88532*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.34848*width + 50, 0.84862*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.34416*width + 50, 0.73853*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.33983*width + 50, 0.66514*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.3355*width + 50, 0.59633*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.37229*width + 50, 0.54587*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.38095*width + 50, 0.61927*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.38745*width + 50, 0.7156*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.39394*width + 50, 0.62844*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.3961*width + 50, 0.68349*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.40693*width + 50, 0.76606*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.41775*width + 50, 0.8211*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.41126*width + 50, 0.7156*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.41342*width + 50, 0.75688*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.42857*width + 50, 0.81193*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.46753*width + 50, 0.6055*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.47186*width + 50, 0.66972*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.47835*width + 50, 0.73394*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.48918*width + 50, 0.7844*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.50433*width + 50, 0.79817*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.49134*width + 50, 0.74312*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.48485*width + 50, 0.69725*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.48268*width + 50, 0.65138*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.47186*width + 50, 0.73394*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.4632*width + 50, 0.6789*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.45887*width + 50, 0.62385*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.45671*width + 50, 0.55046*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.45887*width + 50, 0.48624*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.21212*width + 50, 0.38991*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.2013*width + 50, 0.45872*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.19697*width + 50, 0.52294*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.19697*width + 50, 0.59633*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.18831*width + 50, 0.54587*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.19048*width + 50, 0.47248*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.2013*width + 50, 0.38991*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.21645*width + 50, 0.3211*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.22727*width + 50, 0.22018*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.20996*width + 50, 0.27523*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.19697*width + 50, 0.33028*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.0368*width + 50, 0.59633*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.02814*width + 50, 0.66972*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.01515*width + 50, 0.73853*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.00216*width + 50, 0.78899*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.04978*width + 50, 0.59633*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.04113*width + 50, 0.66514*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.02597*width + 50, 0.74771*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.05628*width + 50, 0.52294*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.05195*width + 50, 0.57339*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.11472*width + 50, 0.39908*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.1039*width + 50, 0.48624*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.11039*width + 50, 0.51376*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.1039*width + 50, 0.57339*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.10173*width + 50, 0.6422*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.0974*width + 50, 0.5367*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.09307*width + 50, 0.62385*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.14069*width + 50, 0.65138*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.14286*width + 50, 0.70642*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.14935*width + 50, 0.7156*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.14935*width + 50, 0.84862*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.21645*width + 50, 0.5367*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.21861*width + 50, 0.63761*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.22294*width + 50, 0.7156*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.69913*width + 50, 0.22936*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.7013*width + 50, 0.27064*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71212*width + 50, 0.33028*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71444*width + 50, 0.35321*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.71212*width + 50, 0.4633*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.71861*width + 50, 0.3945*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71444*width + 50, 0.35321*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.71861*width + 50, 0.22477*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.71645*width + 50, 0.27982*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.71444*width + 50, 0.35321*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.7684*width + 50, 0.16055*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.75974*width + 50, 0.22936*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.75108*width + 50, 0.29817*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.84848*width + 50, 0.25688*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.85498*width + 50, 0.34404*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.88095*width + 50, 0.4633*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.75974*width + 50, 0.66514*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.77922*width + 50, 0.73394*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.80087*width + 50, 0.7844*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.75108*width + 50, 0.78899*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.72727*width + 50, 0.75688*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.96753*width + 50, 0.3211*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.96753*width + 50, 0.35321*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.98701*width + 50, 0.34404*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.98701*width + 50, 0.38991*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.99784*width + 50, 0.42661*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.38745*width + 50, 0.18349*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.3961*width + 50, 0.27064*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.41775*width + 50, 0.29817*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.42857*width + 50, 0.35321*height + 136)];
    [path0 moveToPoint:CGPointMake(0.81818*width + 50, 0.00459*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.82684*width + 50, 0.0367*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.82684*width + 50, 0.07339*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.80087*width + 50, 0.05963*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.79437*width + 50, 0.15138*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.83766*width + 50, 0.73394*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.84848*width + 50, 0.74771*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.87013*width + 50, 0.76606*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.90693*width + 50, 0.83028*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 moveToPoint:CGPointMake(0.56061*width + 50, 0.5367*height + 136)];
    [path0 addLineToPoint:CGPointMake(0.57143*width + 50, 0.59633*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    [path0 addLineToPoint:CGPointMake(0.59957*width + 50, 0.66514*height + 136)];
    [self.headLayers0 addObject:[self createLayerWithPath:path0 color:self.colors[0] andWidth:1]];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 248;
    float height = 175.5;
    [path1 moveToPoint:CGPointMake(0.92*width + 20, 0.57627*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.946*width + 20, 0.62994*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.996*width + 20, 0.70056*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.992*width + 20, 0.60734*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.982*width + 20, 0.51977*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.962*width + 20, 0.4435*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.946*width + 20, 0.39548*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.93*width + 20, 0.35311*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.906*width + 20, 0.30508*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.886*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.876*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.86*width + 20, 0.30508*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.844*width + 20, 0.31356*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.818*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.802*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.782*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.764*width + 20, 0.31356*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.752*width + 20, 0.30508*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.736*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.72*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.692*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.666*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.654*width + 20, 0.30508*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.628*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.604*width + 20, 0.29661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.588*width + 20, 0.29096*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.566*width + 20, 0.30226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.552*width + 20, 0.29096*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.524*width + 20, 0.29096*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.546*width + 20, 0.28249*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.56*width + 20, 0.26554*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.566*width + 20, 0.25424*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.578*width + 20, 0.24011*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.588*width + 20, 0.22034*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.604*width + 20, 0.22034*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.634*width + 20, 0.22034*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.656*width + 20, 0.22034*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.676*width + 20, 0.20339*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.684*width + 20, 0.18079*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.71*width + 20, 0.17514*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.724*width + 20, 0.18927*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.74*width + 20, 0.18079*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.756*width + 20, 0.18927*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.764*width + 20, 0.16667*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.782*width + 20, 0.15537*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.806*width + 20, 0.15537*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.764*width + 20, 0.11299*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.71*width + 20, 0.07062*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.64*width + 20, 0.03107*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.56*width + 20, 0.00847*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.498*width + 20, 0.00282*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.43*width + 20, 0.00847*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.364*width + 20, 0.0226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.312*width + 20, 0.05085*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.266*width + 20, 0.0791*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.288*width + 20, 0.09605*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.304*width + 20, 0.11864*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.316*width + 20, 0.14972*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.318*width + 20, 0.18079*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.304*width + 20, 0.22599*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.282*width + 20, 0.25424*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.266*width + 20, 0.26554*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.248*width + 20, 0.26554*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.22*width + 20, 0.24859*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.2*width + 20, 0.22599*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.186*width + 20, 0.18927*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.186*width + 20, 0.15537*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.136*width + 20, 0.21751*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.102*width + 20, 0.27401*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.072*width + 20, 0.33898*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.05*width + 20, 0.40113*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.044*width + 20, 0.43503*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.058*width + 20, 0.43503*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.072*width + 20, 0.42938*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.098*width + 20, 0.45198*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.122*width + 20, 0.45198*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.146*width + 20, 0.48023*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.16*width + 20, 0.47458*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.18*width + 20, 0.4887*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.17*width + 20, 0.49435*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.146*width + 20, 0.50282*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.126*width + 20, 0.49718*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.118*width + 20, 0.50282*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.102*width + 20, 0.50282*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.09*width + 20, 0.50282*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.082*width + 20, 0.51412*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.074*width + 20, 0.50847*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.066*width + 20, 0.50847*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.044*width + 20, 0.49435*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.022*width + 20, 0.50847*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.012*width + 20, 0.5565*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.004*width + 20, 0.70339*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.022*width + 20, 0.87288*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.05*width + 20, 0.83333*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.072*width + 20, 0.81073*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.118*width + 20, 0.74011*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.16*width + 20, 0.67514*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.92*width + 20, 0.57627*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.876*width + 20, 0.60734*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.92*width + 20, 0.57627*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.9127*width + 20, 0.62994*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.9127*width + 20, 0.69492*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.876*width + 20, 0.60734*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.83*width + 20, 0.47458*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.796*width + 20, 0.4322*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.764*width + 20, 0.4887*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.72*width + 20, 0.55932*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.702*width + 20, 0.5452*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.634*width + 20, 0.64689*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.578*width + 20, 0.76271*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.876*width + 20, 0.60734*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.892*width + 20, 0.64689*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.9127*width + 20, 0.69492*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.578*width + 20, 0.76271*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.546*width + 20, 0.71186*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.464*width + 20, 0.59887*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.434*width + 20, 0.4887*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.416*width + 20, 0.4887*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.39*width + 20, 0.4322*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.578*width + 20, 0.76271*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.578*width + 20, 0.77684*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.592*width + 20, 0.79661*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.621*width + 20, 0.83757*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.39*width + 20, 0.4322*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.344*width + 20, 0.48023*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.33*width + 20, 0.51977*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.286*width + 20, 0.5904*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.262*width + 20, 0.57627*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.39*width + 20, 0.4322*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.374*width + 20, 0.47458*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.368*width + 20, 0.51977*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.262*width + 20, 0.57627*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.2*width + 20, 0.68927*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.16*width + 20, 0.67514*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.262*width + 20, 0.57627*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.262*width + 20, 0.64689*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.27*width + 20, 0.71186*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.16*width + 20, 0.67514*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.174*width + 20, 0.70904*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.18*width + 20, 0.74859*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.18*width + 20, 0.80226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.2*width + 20, 0.85593*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.65*width + 20, 0.87853*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.621*width + 20, 0.83757*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.958*width + 20, 0.80791*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.92*width + 20, 0.71186*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.9127*width + 20, 0.69492*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.621*width + 20, 0.83757*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.676*width + 20, 0.81073*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.68064*width + 20, 0.81921*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.71*width + 20, 0.87288*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.68064*width + 20, 0.81921*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.68064*width + 20, 0.81921*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.71*width + 20, 0.80226*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.736*width + 20, 0.81921*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.776*width + 20, 0.85593*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.818*width + 20, 0.87853*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.852*width + 20, 0.91808*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.876*width + 20, 0.92655*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.938*width + 20, 0.99435*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 moveToPoint:CGPointMake(0.356*width + 20, 0.66102*height + 32.5)];
    [path1 addLineToPoint:CGPointMake(0.356*width + 20, 0.61299*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    [path1 addLineToPoint:CGPointMake(0.362*width + 20, 0.55932*height + 32.5)];
    [self.headLayers1 addObject:[self createLayerWithPath:path1 color:self.colors[1] andWidth:1]];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 221.5;
    float height = 70.5;
    [path2 moveToPoint:CGPointMake(0.00224*width + 35.5, 0.26712*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.06726*width + 35.5, 0.26712*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.13004*width + 35.5, 0.21918*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.20852*width + 35.5, 0.08904*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.28475*width + 35.5, 0.02055*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.3565*width + 35.5, 0.10959*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.41368*width + 35.5, 0.18836*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.47085*width + 35.5, 0.26712*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.41368*width + 35.5, 0.18836*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.41368*width + 35.5, 0.18836*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.47085*width + 35.5, 0.13699*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.5157*width + 35.5, 0.15753*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.5583*width + 35.5, 0.18836*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.61883*width + 35.5, 0.21918*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.71749*width + 35.5, 0.32192*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.67489*width + 35.5, 0.35616*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.73094*width + 35.5, 0.32192*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.77803*width + 35.5, 0.24658*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.84081*width + 35.5, 0.24658*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.90583*width + 35.5, 0.24658*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.99552*width + 35.5, 0.18836*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.09641*width + 35.5, 0.65068*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.15919*width + 35.5, 0.65068*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.23543*width + 35.5, 0.60274*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.31166*width + 35.5, 0.65068*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.42152*width + 35.5, 0.69178*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.61883*width + 35.5, 0.75342*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.47085*width + 35.5, 0.88356*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.57623*width + 35.5, 0.80137*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.67489*width + 35.5, 0.65068*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.73094*width + 35.5, 0.56164*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.8139*width + 35.5, 0.56164*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.91256*width + 35.5, 0.56164*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 moveToPoint:CGPointMake(0.2287*width + 35.5, 0.9726*height + 195.5)];
    [path2 addLineToPoint:CGPointMake(0.28475*width + 35.5, 0.93836*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.39462*width + 35.5, 0.9726*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.52018*width + 35.5, 0.9863*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.61883*width + 35.5, 0.9863*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.71749*width + 35.5, 0.88356*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    [path2 addLineToPoint:CGPointMake(0.82063*width + 35.5, 0.84932*height + 195.5)];
    [self.headLayers2 addObject:[self createLayerWithPath:path2 color:self.colors[2] andWidth:1]];
    return path2;
}

- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
    [self createPath:path0 withInterval:self.interval / 180 andColor:self.colors[0]];
    [self createPath1:path1 withInterval:self.interval / 180 andColor:self.colors[1]];
    [self createPath2:path2 withInterval:self.interval / 180 andColor:self.colors[2]];
}

@end
