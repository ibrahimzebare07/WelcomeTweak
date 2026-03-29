#import <UIKit/UIKit.h>

%hook UIApplication
- (void)applicationDidFinishLaunching:(id)arg1 {
    %orig;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" 
            message:@"Modified By Ibrahim Zebare" 
            preferredStyle:UIAlertControllerStyleAlert];
            
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        
        UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
        [keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    });
}
%end
