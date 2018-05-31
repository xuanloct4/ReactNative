//
//  RootViewUtilities.h
//  ReactNative
//
//  Created by loctv on 5/28/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "DependencyInjection.h"

@interface RootViewUtilities : NSObject
+(NSURL *)jsLocationForRTCBundle:(NSString *) bundleRoot
                fallbackResource:(NSString *) resourceName
               fallbackExtension:(NSString *)extension;

+(NSURL *)jsLocationForMainBundle:(NSString *) resourceBundle
                        extension:(NSString *) extension;

+(RCTRootView *)rootViewWithLaunchingWithOptions: (NSDictionary *) launchOptions
                               initialProperties: (NSDictionary *) props
                                  jsCodeLocation: (NSURL *) jsCodeLocation;
@end
