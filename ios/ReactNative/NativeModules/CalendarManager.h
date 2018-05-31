//
//  CalendarManager.h
//  ReactNative
//
//  Created by loctv on 5/22/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
@interface CalendarManager : RCTEventEmitter <RCTBridgeModule> {
  bool hasListeners;
}
@end
