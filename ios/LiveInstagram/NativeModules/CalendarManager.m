//
//  CalendarManager.m
//  LiveInstagram
//
//  Created by loctv on 5/22/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "CalendarManager.h"
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

//typedef NS_ENUM(NSInteger, UIStatusBarAnimation) {
//  UIStatusBarAnimationNone,
//  UIStatusBarAnimationFade,
//  UIStatusBarAnimationSlide,
//};

@implementation CalendarManager

// To export a module named CalendarManager
RCT_EXPORT_MODULE();

// This would name the module AwesomeCalendarManager instead
// RCT_EXPORT_MODULE(AwesomeCalendarManager);


RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", name, location);
}

//RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch)
//{
//  NSDate *date = [RCTConvert NSDate:secondsSinceUnixEpoch];
//}
//
//RCT_EXPORT_METHOD(addEvent:(NSString *)name details:(NSDictionary *)details)
//{
//  NSString *location = [RCTConvert NSString:details[@"location"]];
//  NSDate *time = [RCTConvert NSDate:details[@"time"]];
//}


#pragma mark - Callbacks
RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
  NSArray *events = [NSArray array];
  callback(@[[NSNull null], events]);
}

#pragma mark - Promises
RCT_REMAP_METHOD(findEvents,
                 findEventsWithResolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  NSArray *events = [NSArray array];
  if (events) {
    resolve(events);
  } else {
    NSError *error = [NSError new];
    reject(@"no_events", @"There were no events", error);
  }
}

#pragma mark - Threading
- (dispatch_queue_t)methodQueue
{
//  return dispatch_get_main_queue();
  return dispatch_queue_create("com.facebook.React.AsyncLocalStorageQueue", DISPATCH_QUEUE_SERIAL);
}

RCT_EXPORT_METHOD(doSomethingExpensive:(NSString *)param callback:(RCTResponseSenderBlock)callback)
{
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    // Call long-running code on background thread
//...
    // You can invoke callback from any thread/queue
    NSArray *events = [NSArray array];
    callback(@[[NSNull null], events]);
  });
}

#pragma mark - Exporting Constants
- (NSDictionary *)constantsToExport
{
  return @{ @"firstDayOfTheWeek": @"Monday" };
}


#pragma mark - Sending Events to JavaScript
- (NSArray<NSString *> *)supportedEvents
{
  return @[@"EventReminder"];
}

// Will be called when this module's first listener is added.
-(void)startObserving {
  hasListeners = YES;
  // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
  hasListeners = NO;
  // Remove upstream listeners, stop unnecessary background tasks
}

- (void)calendarEventReminderReceived:(NSNotification *)notification
{
  NSString *eventName = notification.userInfo[@"name"];
  if (hasListeners) { // Only send events if anyone is listening
    [self sendEventWithName:@"EventReminder" body:@{@"name": eventName}];
  }
}

@end

#pragma mark - Enum Constants
@implementation RCTConvert (StatusBarAnimation)
RCT_ENUM_CONVERTER(UIStatusBarAnimation, (@{ @"statusBarAnimationNone" : @(UIStatusBarAnimationNone),
                                             @"statusBarAnimationFade" : @(UIStatusBarAnimationFade),
                                             @"statusBarAnimationSlide" : @(UIStatusBarAnimationSlide)}),
                   UIStatusBarAnimationNone, integerValue)
- (NSDictionary *)constantsToExport
{
  return @{ @"statusBarAnimationNone" : @(UIStatusBarAnimationNone),
            @"statusBarAnimationFade" : @(UIStatusBarAnimationFade),
            @"statusBarAnimationSlide" : @(UIStatusBarAnimationSlide) };
};

RCT_EXPORT_METHOD(updateStatusBarAnimation:(UIStatusBarAnimation)animation
                  completion:(RCTResponseSenderBlock)callback) {
  
}
@end
