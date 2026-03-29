#import <UIKit/UIKit.h>

%hook UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Call the original method
    BOOL result = %orig;
    
    // Show welcome popup after a short delay to ensure the app is ready
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showWelcomePopup];
    });
    
    return result;
}

%new
- (void)showWelcomePopup {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" 
                                                                   message:@"Welcome to Ibrahim Zebare" 
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" 
                                                       style:UIAlertActionStyleDefault 
                                                     handler:nil];
    
    [alert addAction:okAction];
    
    // Get the root view controller
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *rootViewController = window.rootViewController;
    
    [rootViewController presentViewController:alert animated:YES completion:nil];
}

%end