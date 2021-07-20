#import "AppDelegate.h"
#import "ArtistViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ArtistViewController *artistVC = [[ArtistViewController alloc] initWithNibName:@"ArtistViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:artistVC];
    [window setRootViewController:navVC];
    self.window = window;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
