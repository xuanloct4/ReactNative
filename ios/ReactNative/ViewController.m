//
//  ViewController.m
//  ReactNative
//
//  Created by loctv on 5/23/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation ViewController 

-(void)viewDidLoad {
  NSURL *jsCodeLocation = [((AppDelegate *)[[UIApplication sharedApplication] delegate]) jsLocationForConfiguration];
  
  NSArray *imageList = @[@"https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg?cs=srgb&dl=beach-exotic-holiday-248797.jpg&fm=jpg",
                         @"https://images.pexels.com/photos/413960/pexels-photo-413960.jpeg?cs=srgb&dl=cafe-camera-classic-413960.jpg&fm=jpg"];
  NSDictionary *props = @{@"images" : imageList};
  
  NSDictionary *launchOptions = ((AppDelegate *)[[UIApplication sharedApplication] delegate]).launchOptions;
  
  self.rootView = [RootViewUtilities rootViewWithLaunchingWithOptions:launchOptions initialProperties:props jsCodeLocation:jsCodeLocation];
  
//  rootView.bounds = [[UIScreen mainScreen] bounds];
  self.rootView.bounds = self.reactView.bounds;
  self.rootView.layer.anchorPoint = CGPointMake( 0, 0 );
  
  [self.reactView addSubview:self.rootView];
  
}

-(void)viewDidLayoutSubviews {
  [super viewDidLayoutSubviews];
  self.rootView.bounds = self.reactView.bounds;
  self.rootView.layer.anchorPoint = CGPointMake( 0, 0 );
  [self.reactView reloadInputViews];
}

-(void)tap:(UITapGestureRecognizer *)sender {
  
}
@end
