#import "RSHeadView.h"

@implementation RSHeadView

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

- (void)createPath:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers0 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval:i
                                                     target:self
                                                   selector:@selector(addSublayerToCanvas)
                                                   userInfo:nil repeats:YES];
}

- (void)createPath1:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers1 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
    [self.time1 invalidate];
    self.time1 = nil;
    self.time1 = [NSTimer scheduledTimerWithTimeInterval:i
                                                     target:self
                                                   selector:@selector(addSublayerToCanvas1)
                                                   userInfo:nil repeats:YES];
}

- (void)createPath2:(UIBezierPath *)path forPoints:(NSArray *)points withInterval:(float)i andColor:(UIColor *)color {
    for (id point in points)
    {
        [path addLineToPoint:[point CGPointValue]];
        [self.headLayers2 addObject:[self createLayerWithPath:path color:color andWidth:1]];
    }
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
    float width = 300;
    float height = 300;
    [path0 moveToPoint:CGPointMake(0.23971*width, 0.14412*height)];
    self.points0 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.28529*width, 0.32059*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.32059*width, 0.38824*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.37206*width, 0.44559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45147*width, 0.51176*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.52794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70588*width, 0.38824*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73088*width, 0.35294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73088*width, 0.28676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73676*width, 0.20735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70147*width, 0.17794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.65294*width, 0.18676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62059*width, 0.23676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.61471*width, 0.30441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.34118*height)], nil];
    return path0;
}

- (UIBezierPath *)drawSecondStrokeWithPath {
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path1 moveToPoint:CGPointMake(0.6*width, 0.35294*height)];
    self.points1 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.575*width, 0.34853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54706*width, 0.35441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52353*width, 0.35735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49559*width, 0.35441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47059*width, 0.35*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45147*width, 0.34853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.42941*width, 0.35294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.41618*width, 0.35882*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.36618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.44706*width, 0.37647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46029*width, 0.39118*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47794*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.5*width, 0.40147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54265*width, 0.40147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56029*width, 0.39853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57941*width, 0.38676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.6*width, 0.36324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.61324*width, 0.34559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58971*width, 0.34265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56324*width, 0.33971*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.53676*width, 0.33382*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.51176*width, 0.33235*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.48235*width, 0.33676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45588*width, 0.34265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.42647*width, 0.34559*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.40588*width, 0.34412*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.32647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46029*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.47794*width, 0.29706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49265*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.50882*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52794*width, 0.30441*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.54706*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56324*width, 0.30147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57206*width, 0.30735*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58676*width, 0.32206*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60882*width, 0.33529*height)], nil];
    return path1;
}

- (UIBezierPath *)drawThirdStrokeWithPath {
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float width = 300;
    float height = 300;
    [path2 moveToPoint:CGPointMake(0.61618*width, 0.36029*height)];
    self.points2 = [NSArray arrayWithObjects:
                       [NSValue valueWithCGPoint:CGPointMake(0.62941*width, 0.37794*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.63676*width, 0.39706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.62647*width, 0.42353*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60588*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.57941*width, 0.46912*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.55147*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.49265*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.45735*width, 0.44853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.43382*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.41471*width, 0.51324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.38088*width, 0.49265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.35735*width, 0.46324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.43676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.47647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.56029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33235*width, 0.61029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.31176*width, 0.64412*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.27794*width, 0.66912*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.24559*width, 0.68971*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.29706*width, 0.70882*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.33676*width, 0.73382*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.36765*width, 0.775*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.40882*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.46471*width, 0.87941*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.52059*width, 0.89853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.56176*width, 0.89853*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.60588*width, 0.875*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.64559*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.675*width, 0.76324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.71618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.74559*width, 0.69706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.75588*width, 0.69706*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.73676*width, 0.65147*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70882*width, 0.56765*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.5*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.70294*width, 0.43088*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.68235*width, 0.46324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.65882*width, 0.48676*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.63676*width, 0.51324*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.58824*width, 0.56029*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.55882*width, 0.60294*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.53382*width, 0.66618*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.74265*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.82647*height)],
                       [NSValue valueWithCGPoint:CGPointMake(0.525*width, 0.87941*height)], nil];
    return path2;
}


- (void)drawPath0:(UIBezierPath *)path0 path1:(UIBezierPath *)path1 andPath2:(UIBezierPath *)path2 {
    [self createPath:path0 forPoints:self.points0 withInterval:self.interval / 60 andColor:self.colors[0]];
    [self createPath1:path1 forPoints:self.points1 withInterval:self.interval / 60 andColor:self.colors[1]];
    [self createPath2:path2 forPoints:self.points2 withInterval:self.interval / 60 andColor:self.colors[2]];
}

@end

