//
//  RootViewUtilities.m
//  ReactNative
//
//  Created by loctv on 5/28/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RootViewUtilities.h"

@implementation RootViewUtilities

+(NSURL *)jsLocationForRTCBundle:(NSString *) bundleRoot
                fallbackResource:(NSString *) resourceName
               fallbackExtension:(NSString *)extension {
  NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:bundleRoot fallbackResource:resourceName fallbackExtension:extension];
  return jsCodeLocation;
}

+(NSURL *)jsLocationForMainBundle:(NSString *) resourceBundle
                        extension:(NSString *) extension {
  NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:resourceBundle withExtension:extension];
  return jsCodeLocation;
}

+(RCTRootView *)rootViewWithLaunchingWithOptions: (NSDictionary *) launchOptions
                               initialProperties: (NSDictionary *) props
                                  jsCodeLocation: (NSURL *) jsCodeLocation {
  
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ReactNative"
                                               initialProperties:props
                                                   launchOptions:launchOptions];
  
  //  id<RCTBridgeDelegate> moduleInitialiser = [[DependencyInjection alloc] init];
  //  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:moduleInitialiser launchOptions:nil];
  //  RCTRootView *rootView = [[RCTRootView alloc]
  //                           initWithBridge:bridge
  //                           moduleName:@"ReactNative"
  //                           initialProperties:nil];
  
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  return rootView;
}
@end
