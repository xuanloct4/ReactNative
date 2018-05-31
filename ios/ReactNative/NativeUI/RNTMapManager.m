//
//  RNTMapManager.m
//  ReactNative
//
//  Created by loctv on 5/22/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "RNTMapManager.h"
#import "AppDelegate.h"

@implementation RNTMapManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL)

RCT_EXPORT_VIEW_PROPERTY(onRegionChange, RCTBubblingEventBlock)


- (UIView *)view {
  RNTMapView *map = [RNTMapView new];
  map.delegate = self;
  return map;
}

RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
{
  [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}


#pragma mark MKMapViewDelegate
- (void)mapView:(RNTMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
  if (!mapView.onRegionChange) {
    return;
  }
  
  MKCoordinateRegion region = mapView.region;
  mapView.onRegionChange(@{
                           @"region": @{
                               @"latitude": @(region.center.latitude),
                               @"longitude": @(region.center.longitude),
                               @"latitudeDelta": @(region.span.latitudeDelta),
                               @"longitudeDelta": @(region.span.longitudeDelta),
                               }
                           });
}
@end



@implementation RCTConvert(MapKit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
  json = [self NSDictionary:json];
  return (MKCoordinateSpan){
    [self CLLocationDegrees:json[@"latitudeDelta"]],
    [self CLLocationDegrees:json[@"longitudeDelta"]]
  };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
  return (MKCoordinateRegion){
    [self CLLocationCoordinate2D:json],
    [self MKCoordinateSpan:json]
  };
}

@end
