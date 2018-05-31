//
//  ViewController.h
//  ReactNative
//
//  Created by loctv on 5/23/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RootViewUtilities.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *reactView;
@property (weak, nonatomic) IBOutlet UIScrollView *nativeView;

@property (strong, nonatomic) RCTRootView *rootView;
@end
