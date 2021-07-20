#import "ArtistViewController.h"
#import "RSColorItem.h"
#import "RSUIButton.h"
#import "RSPalletVC.h"
#import "RSHeadView.h"
#import "RSTreeView.h"
#import "RSLandscapeView.h"
#import "RSPlanetView.h"

@interface ArtistViewController ()

@property (weak, nonatomic) IBOutlet UIView *drawView;
@property (weak, nonatomic) IBOutlet RSUIButton *openPalletteButton;
@property (weak, nonatomic) IBOutlet RSUIButton *openTimerButton;
@property (weak, nonatomic) IBOutlet RSUIButton *shareButton;
@property (weak, nonatomic) IBOutlet RSUIButton *drawButton;
@property (weak, nonatomic) IBOutlet RSUIButton *resetButton;

@property (strong, nonatomic) NSArray<UIColor *> *colors;
@property (strong, nonatomic) RSHeadView *head;
@property (strong, nonatomic) RSTreeView *tree;
@property (strong, nonatomic) RSLandscapeView *land;
@property (strong, nonatomic) RSPlanetView *planet;
@property BOOL stopRedraw;
@property NSInteger number;
@property (nonatomic) float timeValue;

@end

@implementation ArtistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addObserver:self forKeyPath:@"self.state" options:NSKeyValueObservingOptionNew context:nil];
    self.head = [[RSHeadView alloc] initWithFrame:self.drawView.bounds];
    self.tree = [[RSTreeView alloc] initWithFrame:self.drawView.bounds];
    self.land = [[RSLandscapeView alloc] initWithFrame:self.drawView.bounds];
    self.planet = [[RSPlanetView alloc] initWithFrame:self.drawView.bounds];
    self.state = NSIdle;
    [self createTimerVC];
    [self createPalletVC];
    [self makeTitleItem];
    [self makeRightBarButtonIntem];
    [self makeCanvas];
    [self addActionsOnButtons];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.stopRedraw)
    {
        self.head.noDraw = YES;
        self.tree.noDraw = YES;
        self.land.noDraw = YES;
        self.planet.noDraw = YES;
    }
}

#pragma mark UI

- (void)makeRightBarButtonIntem {
    UIButton *item = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 79, 22)];
    item.titleLabel.textColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1];
    item.titleLabel.font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.06;
    item.titleLabel.textAlignment = NSTextAlignmentRight;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Drawings" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle,
                  NSKernAttributeName: @-0.41}];
    [item setAttributedTitle:string forState:UIControlStateNormal];
    [item addTarget:self action:@selector(tapOnRightBarItem) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:item];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)makeTitleItem {
    UILabel *middleItem = [UILabel new];
    middleItem.frame = CGRectMake(0, 0, 44, 22);
    middleItem.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    middleItem.font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.06;
    middleItem.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Artist" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle,
                  NSKernAttributeName: @-0.41}];
    middleItem.attributedText = string;
    self.navigationItem.titleView = middleItem;
}

- (void)makeCanvas {
    self.drawView.backgroundColor = [UIColor whiteColor];
    self.drawView.clipsToBounds = NO;
    UIBezierPath *shadowPath0 = [UIBezierPath bezierPathWithRoundedRect:self.drawView.bounds cornerRadius:8];
    self.drawView.layer.shadowPath = shadowPath0.CGPath;
    self.drawView.layer.shadowColor = [UIColor colorWithRed:0 green:0.7 blue:1 alpha:0.25].CGColor;
    self.drawView.layer.shadowOpacity = 1;
    self.drawView.layer.shadowRadius = 4;
    self.drawView.layer.shadowOffset = CGSizeMake(0, 0);
    self.drawView.layer.bounds = self.drawView.bounds;
    self.drawView.layer.position = self.drawView.center;
    self.drawView.layer.cornerRadius = 8;
}

#pragma mark Action

- (void)tapOnRightBarItem {
    RSDrawingsVC *drawVC = [[RSDrawingsVC alloc] initWithNibName:@"RSDrawingsVC" bundle:nil];
    drawVC.delegate = self;
    UILabel *middleItem = [UILabel new];
    middleItem.frame = CGRectMake(0, 0, 79, 22);
    middleItem.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    middleItem.font = [UIFont fontWithName:@"Montserrat-Regular" size:17];
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineHeightMultiple = 1.06;
    middleItem.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Drawings" attributes: @{
        NSParagraphStyleAttributeName: paragraphStyle,
                  NSKernAttributeName: @-0.41}];
    middleItem.attributedText = string;
    drawVC.navigationItem.titleView = middleItem;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1];
    self.navigationItem.backButtonTitle = @"Artist";
    UIBarButtonItem *backbutton =  [[UIBarButtonItem alloc] initWithTitle:@"Artist" style:UIBarButtonItemStylePlain target:nil action:nil];
    [backbutton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1], NSForegroundColorAttributeName, [UIFont fontWithName:@"Montserrat-Regular" size:17], NSFontAttributeName,
                                        nil] forState:UIControlStateNormal];
    self.navigationItem.backBarButtonItem = backbutton;
    if (self.number)
    {
        for (UIButton *button in drawVC.view.subviews)
        {
            if (button.tag == self.number)
            {
                button.layer.shadowColor = [UIColor colorWithRed:0.13 green:0.692 blue:0.557 alpha:1].CGColor;
                button.layer.shadowRadius = 2;
            }
        }
    }
    [self.navigationController pushViewController:drawVC animated:NO];
}

- (void)addActionsOnButtons {
    [self.drawButton addTarget:self action:@selector(tapOnDraw) forControlEvents:UIControlEventTouchUpInside];
    [self.openPalletteButton addTarget:self action:@selector(tapOnPallete) forControlEvents:UIControlEventTouchUpInside];
    [self.resetButton addTarget:self action:@selector(tapOnReset) forControlEvents:UIControlEventTouchUpInside];
    [self.openTimerButton addTarget:self action:@selector(tapOnTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(tapOnShare) forControlEvents:UIControlEventTouchUpInside];
}

- (void)tapOnShare {
    self.land.noDraw = YES;
    self.head.noDraw = YES;
    self.planet.noDraw = YES;
    self.tree.noDraw = YES;
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, 0, 0);
    [self.drawView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *imageToSave = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[imageToSave] applicationActivities:nil];
    activityVC.excludedActivityTypes = @[UIActivityTypeAirDrop];
    [self presentViewController:activityVC animated:YES completion:^{}];
}


- (void)tapOnTimer {
    self.childViewControllers.firstObject.view.hidden = NO;
}

- (void)tapOnReset {
    self.state = NSIdle;
    [self.time invalidate];
    self.time = nil;
    self.time = [NSTimer scheduledTimerWithTimeInterval: 0.0008
                                                     target: self
                                                   selector:@selector(deleteLayer)
                                                   userInfo: nil repeats:YES];
}

- (void)deleteLayer {
    if (self.drawView.subviews.lastObject.layer.sublayers.count > 0)
        [self.drawView.subviews.lastObject.layer.sublayers.lastObject removeFromSuperlayer];
    else
    {
        [self.time invalidate];
        self.time = nil;
        [self.drawView.subviews.lastObject removeFromSuperview];
    }
}

- (void)tapOnDraw {
    self.head.noDraw = NO;
    self.state = NSDraw;
    self.head.delegate = self;
    self.head.colors = self.colors;
    self.head.interval = self.timeValue;
    self.tree.noDraw = NO;
    self.tree.delegate = self;
    self.tree.colors = self.colors;
    self.tree.interval = self.timeValue;
    self.land.delegate = self;
    self.land.colors = self.colors;
    self.land.interval = self.timeValue;
    self.land.noDraw = NO;
    self.planet.delegate = self;
    self.planet.colors = self.colors;
    self.planet.interval = self.timeValue;
    self.planet.noDraw = NO;
    if (self.number == 2 || !self.number)
        [self.drawView addSubview:self.head];
    if (self.number == 3)
        [self.drawView addSubview:self.tree];
    if (self.number == 4)
        [self.drawView addSubview:self.land];
    if (self.number == 1)
        [self.drawView addSubview:self.planet];
}

- (void)createTimerVC {
    RSTimerVC *timerVC = [[RSTimerVC alloc] initWithNibName:@"RSTimerVC" bundle:nil];
    [self addChildViewController:timerVC];
    timerVC.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:timerVC.view];
    [timerVC didMoveToParentViewController:self];
    timerVC.delegate = self;
    timerVC.view.hidden = YES;
}

- (void)createPalletVC {
    RSPalletVC *palletVC = [[RSPalletVC alloc] initWithNibName:@"RSPalletVC" bundle:nil];
    [self addChildViewController:palletVC];
    palletVC.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.size.height / 2, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:palletVC.view];
    [palletVC didMoveToParentViewController:self];
    palletVC.delegate = self;
    palletVC.view.hidden = YES;
}

- (void)tapOnPallete {
    self.childViewControllers.lastObject.view.hidden = NO;
}

- (void)checkState {
    if (self.state == NSIdle)
    {
        self.openPalletteButton.userInteractionEnabled = YES;
        self.openPalletteButton.alpha = 1;
        self.openTimerButton.userInteractionEnabled = YES;
        self.openTimerButton.alpha = 1;
        self.resetButton.userInteractionEnabled = NO;
        self.resetButton.hidden = YES;
        self.drawButton.hidden = NO;
        self.drawButton.userInteractionEnabled = YES;
        self.drawButton.alpha = 1;
        self.shareButton.userInteractionEnabled = NO;
        self.shareButton.alpha = 0.5;
    }
    if (self.state == NSDraw)
    {
        for (UIButton *button in self.view.subviews)
        {
            if ([button isKindOfClass:[RSUIButton class]])
            {
                [button setUserInteractionEnabled:NO];
                [button setAlpha:0.5];
            }
        }
    }
    if (self.state == NSDone)
    {
        self.shareButton.alpha = 1;
        self.shareButton.userInteractionEnabled = YES;
        self.drawButton.userInteractionEnabled = NO;
        self.drawButton.hidden = YES;
        self.resetButton.hidden = NO;
        self.resetButton.userInteractionEnabled = YES;
        self.resetButton.alpha = 1;
        self.openPalletteButton.userInteractionEnabled = NO;
        self.openPalletteButton.alpha = 0.5;
        self.openTimerButton.userInteractionEnabled = NO;
        self.openTimerButton.alpha = 0.5;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self checkState];
}

#pragma mark Delegations

- (void)passChoosenColors:(NSArray<UIColor *> *)theValue {
    NSMutableArray *tmp = theValue.mutableCopy;
    if (theValue.count < 3)
    {
        NSInteger blacks = 3 - theValue.count;
        for (int i = 0; i < blacks; i++)
            [tmp addObject:[UIColor blackColor]];
    }
    self.colors = tmp;
}

- (void)isReady:(BOOL)theValue {
    if (theValue)
    {
        self.state = NSDone;
        self.stopRedraw = YES;
    }
}

- (void)getResultTimeWithTheValue:(float)theValue {
    self.timeValue = theValue;
}

- (void)getResultShapeWithTheValue:(NSString *)theValue {
    if ([theValue isEqualToString:@"Head"])
    {
        self.number = 2;
    }
    if ([theValue isEqualToString:@"Tree"])
    {
        self.number = 3;
    }
    if ([theValue isEqualToString:@"Planet"])
    {
        self.number = 1;
    }
    if ([theValue isEqualToString:@"Landscape"])
    {
        self.number = 4;
    }
}

@end
