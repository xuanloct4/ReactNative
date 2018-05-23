/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.launchOptions = launchOptions;
  NSURL *jsCodeLocation;
// For Developer
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

//  // For Release
//  jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
  
  NSArray *imageList = @[@"https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?cs=srgb&dl=beach-exotic-holiday-248797.jpg&fm=jpg",
                         @"https://images.pexels.com/photos/413960/pexels-photo-413960.jpeg?cs=srgb&dl=cafe-camera-classic-413960.jpg&fm=jpg"];
  
  NSDictionary *props = @{@"images" : imageList};
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"LiveInstagram"
                                               initialProperties:props
                                                   launchOptions:launchOptions];
  
//  id<RCTBridgeDelegate> moduleInitialiser = [[DependencyInjection alloc] init];
//  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:moduleInitialiser launchOptions:nil];
//  RCTRootView *rootView = [[RCTRootView alloc]
//                           initWithBridge:bridge
//                           moduleName:@"LiveInstagram"
//                           initialProperties:nil];
  
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  ViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier: @"ViewController"];
//  UIViewController *rootViewController = [UIViewController new];
//  [rootViewController.view addSubview:rootView];
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  UIView* launchScreenView = [[[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil] objectAtIndex:0];
  launchScreenView.frame = self.window.bounds;
  rootView.loadingView = launchScreenView;
  return YES;
}

@end
