//
//  ViewController.h
//  LiveInstagram
//
//  Created by loctv on 5/23/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "DependencyInjection.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *reactView;
@property (weak, nonatomic) IBOutlet UIView *nativeView;

@end
