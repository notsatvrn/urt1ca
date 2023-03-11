#import "AppDelegate.h"
#import <UIKit/UIKit.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(id)options {
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor blackColor];
    viewController.view.frame = mainScreenBounds;
    
    NSString* msg = [NSString stringWithString:@"hello"];
    
    UILabel *label = [[UILabel alloc] initWithFrame:mainScreenBounds];
    [label setText:msg];
    [viewController.view addSubview: label];

    self.window.rootViewController = viewController;

    [self.window makeKeyAndVisible];

    return YES;
}

@end
