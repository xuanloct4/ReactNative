//
//  CalendarManagerSwift.swift
//  ReactNative
//
//  Created by loctv on 5/22/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import UIKit

@objc(CalendarManagerSwift)
class CalendarManagerSwift: NSObject {
 
    @objc(addEvent:location:date:)
    func addEvent(name: String, location: String, date: NSNumber) -> Void {
      // Date is ready to use!
    }
    
    @objc
    func constantsToExport() -> [String: Any]! {
      return ["someKey": "someValue"]
    }

}
