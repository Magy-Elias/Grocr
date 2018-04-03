////
////  Results.swift
////  OpenLock
////
////  Created by Magy Elias on 3/19/18.
////  Copyright © 2018 Magy Elias. All rights reserved.
////
//
//import Foundation
//
////class OnArray {
////    var onString: String = ""
////}
////
////class ConnectivityMethods {
////    var methods: Int = 0
////}
//
//class ResultItems {
//    let key: String
//    var accessId: String = ""
//    var isAnyTime: Bool = false
//    var range: Int = 0
//    var repeatInterval: String? = nil
//    var on: [String]?
//    var fromTime: String? = nil
//    var toTime: String? = nil
//    var startDate: String? = nil
//    var expirationDate: String? = nil
//    var connectivityMethodIds: [Int]
//    let ref: FIRDatabaseReference?
//  
//  init(accessId: String, isAnyTime: Bool, range: Int, repeatInterval: String? = nil, on: [String]?, fromTime: String? = nil, toTime: String? = nil, startDate: String? = nil, expirationDate: String? = nil, connectivityMethodIds: [Int], key: String = "") {
//      self.key = key
//      self.accessId = accessId
//      self.isAnyTime = isAnyTime
//      self.range = range
//      self.repeatInterval = repeatInterval
//      self.on = on
//      self.fromTime = fromTime
//      self.toTime = toTime
//      self.startDate = startDate
//      self.expirationDate = expirationDate
//      self.connectivityMethodIds = connectivityMethodIds
//      self.ref = nil
//    }
//  
//    init(snapshot: FIRDataSnapshot) {
//      key = snapshot.key
//      let snapshotValue = snapshot.value as! [String: AnyObject]
//      accessId = snapshotValue["accessId"] as! String
//      isAnyTime = snapshotValue["isAnyTime"] as! Bool
//      range = snapshotValue["range"] as! Int
//      repeatInterval = snapshotValue["repeatInterval"] as? String
//      on = snapshotValue["on"] as? [String]
//      fromTime = snapshotValue["fromTime"] as? String
//      toTime = snapshotValue["toTime"] as? String
//      startDate = snapshotValue["startDate"] as? String
//      expirationDate = snapshotValue["expirationDate"] as? String
//      connectivityMethodIds = snapshotValue["connectivityMethodIds"] as! [Int]
//      ref = snapshot.ref
//    }
//  
//    func toAnyObject() -> Any {
//      return [
//        "accessId": accessId,
//        "isAnyTime": isAnyTime,
//        "range": range,
//        "repeatInterval": repeatInterval ?? "",
//        "on": on ?? [""],
//        "fromTime": fromTime ?? "",
//        "toTime": toTime ?? "",
//        "startDate": startDate ?? "",
//        "expirationDate": expirationDate ?? "",
//        "connectivityMethodIds": connectivityMethodIds
//      ]
//    }
//  
//  
////  private enumpir ResultsCodingKeys : String, CodingKey {
////  case accessId = "accessId"
////  case isAnyTime = "isAnyTime"
////  case range = "range"
////  case repeatInterval = "repeatInterval"
////  case on = "on"
////  case startDate = "startDate"
////  case expirationDate = "expirationDate"
////  case fromTime = "fromTime"
////  case toTime =  "toTime"
////  case connectivityMethodIds = "connectivityMethodIds"
////  }
////
////  required convenience public init(from decoder: Decoder) throws {
////    self.init()
////    let container = try decoder.container(keyedBy: ResultsCodingKeys.self)
////    accessId = try container.decode(String.self, forKey: .accessId)
////    isAnyTime = try container.decode(Bool.self, forKey: .isAnyTime)
////    range = try container.decode(Int.self, forKey: .range)
////    repeatInterval = try container.decodeIfPresent(String.self, forKey: .repeatInterval)
////    
////    let onString = try container.decode([OnArray].self, forKey: .on)
////    on = List(onString)
////
////    startDate = try container.decodeIfPresent(String.self, forKey: .startDate)
////    expirationDate = try container.decodeIfPresent(String.self, forKey: .expirationDate)
////    fromTime = try container.decodeIfPresent(String.self, forKey: .fromTime)
////    toTime = try container.decodeIfPresent(String.self, forKey: .toTime)
////    
////    let methods = try container.decode([ConnectivityMethods].self, forKey: .connectivityMethodIds)
////    connectivityMethodIds = List(methods)
////    
////    //        let fromTimeString = try container.decode(String.self, forKey: .fromTime)
////    //        let toTimeString = try container.decode(String.self, forKey: .toTime)
////    //        let dateFormatter = DateFormatter()
////    //        dateFormatter.dateFormat = "HH:mm:ss"
////    //        let dateFrom = dateFormatter.date(from: fromTimeString)
////    //        let dateTo = dateFormatter.date(from: toTimeString)
////    //        dateFormatter.dateFormat = "hh:mm a"
////    //        fromTime = dateFormatter.string(from: dateFrom!)
////    //        toTime = dateFormatter.string(from: dateTo!)
////    ////        fromTime = try container.decode(String.self, forKey: .fromTime)
////    ////        toTime = try container.decode(String.self, forKey: .toTime)
////    
////    //        let startDateString = try container.decode(String.self, forKey: .startDate)
////    //        let getStartDateTimeReturn = getStartExeDateTimeString(dateString: startDateString)
////        //        startDate = getStartDateTimeReturn.date!
////        //        startTime = getStartDateTimeReturn.time!
////        ////        print("startDate = \(String(describing: self.startDate))")
////        ////        print("startTime = \(String(describing: self.startTime))")
////        //
////        //        let expireDateString =  try container.decode(String.self, forKey: .expirationDate)
////        //        let getExpireDateTimeReturn = getStartExpireDateTimeString(dateString: expireDateString)
////        //        expirationDate = getExpireDateTimeReturn.date!
////        //        expirationTime = getExpireDateTimeReturn.time!
////        ////        print("expirationDate = \(String(describing: self.expirationDate))")
////        ////        print("expirationTime = \(String(describing: self.expirationTime))")
////    }
////
////    func encode(to encoder: Encoder) throws {
////        do {
////            var container = encoder.container(keyedBy: ResultsCodingKeys.self)
////            try container.encode(accessId, forKey: .accessId)
////            try container.encode(isAnyTime, forKey: .isAnyTime)
////            try container.encode(range, forKey: .range)
////            try container.encode(repeatInterval, forKey: .repeatInterval)
////            //            try container.encode(on, forKey: .on)
////            //            let onString = try container.decode([OnArray].self, forKey: .on)
////            //            on = List(onString)
////            //
////            //            let methods = try container.decode([ConnectivityMethods].self, forKey: .connectivityMethodIds)
////            //            connectivityMethodIds = List(methods)
////
////            try container.encode(fromTime, forKey: .fromTime)
////            try container.encode(toTime, forKey: .toTime)
////            try container.encode(startDate, forKey: .startDate)
////            try container.encode(expirationDate, forKey: .expirationDate)
////        } catch {
////            print(error)
////        }
////    }
//  
//}
//
//
//
