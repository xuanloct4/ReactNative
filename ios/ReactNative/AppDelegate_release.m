/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "ViewController.h"
#import "AppDelegate.h"
#import "Orientation.h"
#import "RootViewUtilities.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
  
  UIView* launchScreenView = [[[NSBundle mainBundle] loadNibNamed:@"LaunchScreen" owner:self options:nil] objectAtIndex:0];
  launchScreenView.frame = self.window.bounds;
  rootView.loadingView = launchScreenView;
  return YES;
}

-(NSURL *)jsLocationForConfiguration {
  NSURL *jsCodeLocation;
  //// For Developer
  //jsCodeLocation = [RootViewUtilities jsLocationForRTCBundle:@"index" fallbackResource:nil fallbackExtension:nil];
  
  // For Release
  jsCodeLocation = [RootViewUtilities jsLocationForMainBundle:@"main" extension:@"jsbundle"];
  return jsCodeLocation;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
  return [Orientation getOrientation];
}
@end
