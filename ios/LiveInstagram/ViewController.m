//
//  ViewController.m
//  LiveInstagram
//
//  Created by loctv on 5/23/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation ViewController


-(void)viewDidLoad {
  NSURL *jsCodeLocation;
  // For Developer
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
  
  //  // For Release
  //  jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
  
  NSArray *imageList = @[@"https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?cs=srgb&dl=beach-exotic-holiday-248797.jpg&fm=jpg",
                         @"https://images.pexels.com/photos/413960/pexels-photo-413960.jpeg?cs=srgb&dl=cafe-camera-classic-413960.jpg&fm=jpg"];
  
  NSDictionary *props = @{@"images" : imageList};
  
  NSDictionary *launchOptions = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).launchOptions;
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
  
  [self.reactView addSubview:rootView];

}
@end
