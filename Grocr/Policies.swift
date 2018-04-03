/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation

class Policies {
  
  let key: String
  let accessId: String
  let isAnyTime: Bool
  let range: Int
  let repeatInterval: String?
  let on: [String]?
  let fromTime: String?
  let toTime: String?
  let startDate: String?
  let expirationDate: String?
  let connectivityMethodIds: [Int]
  let ref: FIRDatabaseReference?
  
  init(accessId: String, isAnyTime: Bool, range: Int, repeatInterval: String?, on: [String]?, fromTime: String?, toTime: String?, startDate: String?, expirationDate: String?, connectivityMethodIds: [Int], key: String = "") {
    self.key = key
    self.accessId = accessId
    self.isAnyTime = isAnyTime
    self.range = range
    self.repeatInterval = repeatInterval
    self.on = on
    self.fromTime = fromTime
    self.toTime = toTime
    self.startDate = startDate
    self.expirationDate = expirationDate
    self.connectivityMethodIds = connectivityMethodIds
    self.ref = nil
  }
  
  init(snapshot: FIRDataSnapshot) {
    key = snapshot.key
    let snapshotValue = snapshot.value as! [String: AnyObject]
    accessId = snapshotValue["accessId"] as! String
    isAnyTime = snapshotValue["isAnyTime"] as! Bool
    range = snapshotValue["range"] as! Int
    repeatInterval = snapshotValue["repeatInterval"] as? String
    on = snapshotValue["on"] as? [String]
    fromTime = snapshotValue["fromTime"] as? String
    toTime = snapshotValue["toTime"] as? String
    startDate = snapshotValue["startDate"] as? String
    expirationDate = snapshotValue["expirationDate"] as? String
    connectivityMethodIds = snapshotValue["connectivityMethodIds"] as! [Int]
    ref = snapshot.ref
  }
  
  func toAnyObject() -> Any {
    return [
      "accessId": accessId,
      "isAnyTime": isAnyTime,
      "range": range,
      "repeatInterval": repeatInterval ?? "",
      "on": on ?? [""],
      "fromTime": fromTime ?? "",
      "toTime": toTime ?? "",
      "startDate": startDate ?? "",
      "expirationDate": expirationDate ?? "",
      "connectivityMethodIds": connectivityMethodIds
    ]
  }
  
}

