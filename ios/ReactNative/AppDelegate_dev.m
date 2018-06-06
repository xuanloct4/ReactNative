/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#if DEBUG
  NSLog(@"I'm running in DEBUG mode");
#else
  NSLog(@"I'm running in a non-DEBUG mode");
#endif
  
  self.launchOptions = launchOptions;
  NSURL * jsCodeLocation = [self jsLocationForConfiguration];
  
  NSArray *imageList = @[@"https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?cs=srgb&dl=beach-exotic-holiday-248797.jpg&fm=jpg",
                         @"https://images.pexels.com/photos/413960/pexels-photo-413960.jpeg?cs=srgb&dl=cafe-camera-classic-413960.jpg&fm=jpg"];
  NSDictionary *props = @{@"images" : imageList};
  
  RCTRootView *rootView = [RootViewUtilities rootViewWithLaunchingWithOptions:launchOptions initialProperties:props jsCodeLocation:jsCodeLocation];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  self.rootViewController = [storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
  //  self.rootViewController = [UIViewController new];
  //  self.rootViewController.view = rootView;
  //  // or add as subview
  //  [self.rootViewController.view addSubview:rootView];
  
  self.window.rootViewController = self.rootViewController;
  [self.window makeKeyAndVisible];
  
  UIView* launchScreenView = [[[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil] objectAtIndex:0];
  launchScreenView.frame = self.window.bounds;
  rootView.loadingView = launchScreenView;
  return YES;
}

-(NSURL *)jsLocationForConfiguration {
  NSURL *jsCodeLocation;
  // For Developer
#ifdef DEBUG
  jsCodeLocation = [RootViewUtilities jsLocationForRTCBundle:@"index" fallbackResource:nil fallbackExtension:nil];
  // For Release
#else
  jsCodeLocation = [RootViewUtilities jsLocationForMainBundle:@"main" extension:@"jsbundle"];
#endif
  
  return jsCodeLocation;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
  return [Orientation getOrientation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0]; //Allways reset number of notifications shown at the icon
  for (UILocalNotification * notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) { //Also remove all shown notifications
    if ([notification.fireDate compare:[NSDate date]] == NSOrderedAscending) {
      [[UIApplication sharedApplication] cancelLocalNotification:notification];
    }
  }
}

// Required to register for notifications
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
  [RCTPushNotificationManager didRegisterUserNotificationSettings:notificationSettings];
}
// Required for the register event.
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
  [RCTPushNotificationManager didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}
// Required for the notification event. You must call the completion handler after handling the remote notification.
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
  [RCTPushNotificationManager didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}
// Required for the registrationError event.
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
  [RCTPushNotificationManager didFailToRegisterForRemoteNotificationsWithError:error];
}
// Required for the localNotification event.
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
  [RCTPushNotificationManager didReceiveLocalNotification:notification];
}

////...........Handling delegate methods for UserNotifications........
//Called when a notification is delivered to a foreground app.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
  NSLog(@"User Info : %@",notification.request.content.userInfo);
  completionHandler(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge);
}

//Called to let your app know which action was selected by the user for a given notification.
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler{
  NSLog(@"User Info : %@",response.notification.request.content.userInfo);
  completionHandler();
}
@end
