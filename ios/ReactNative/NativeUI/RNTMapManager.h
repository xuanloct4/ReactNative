//
//  RNTMapManager.h
//  ReactNative
//
//  Created by loctv on 5/22/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <MapKit/MapKit.h>
#import <React/RCTViewManager.h>
#import <MapKit/MapKit.h>
#import <React/RCTConvert.h>
#import <CoreLocation/CoreLocation.h>
#import <React/RCTConvert+CoreLocation.h>
#import "RNTMapView.h"

@interface RNTMapManager : RCTViewManager<RCTBridgeModule, MKMapViewDelegate>

@end


@interface RCTConvert (Mapkit)
+ (MKCoordinateSpan)MKCoordinateSpan:(id)json;
+ (MKCoordinateRegion)MKCoordinateRegion:(id)json;
@end

