//
//  BusScheduleResult.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 08/04/2021.
//

import Foundation

struct BusesScheduleResult: Decodable {
    let timetable: TimeTableModel?
    let station: LocationInfoModel?
}

struct TimeTableModel: Decodable {
    let arrivals: [BusScheduleModel]?
    let departures: [BusScheduleModel]?
    let message: String?
}

struct BusScheduleModel: Decodable {
    let through_the_stations: String?
    var datetime: DateTimeModel?
    let line_direction: String?
    let route: [LocationInfoModel]?
    let ride_id: Double?
    let trip_uid: String?
    let has_tracker: Bool?
    let is_cancelled: Bool?
    let line_code: String?
    let direction: String?
}

struct DateTimeModel: Decodable {
    let tz: String?
    let timestamp: Double?
    var dateString: String{
        return Utils.formatTimeStampToDate(timestamp: timestamp, timezone:tz)
    }
    var timeString: String{
        return Utils.formatTimeStampToHourlyTime(timestamp: timestamp, timezone:tz)
    }
    
}

struct LocationInfoModel: Decodable {
    let id: Int?
    let uuid: String?
    let name: String?
    let default_address: AddressModel?
    let address: String?
    let full_address: String?
    let coordinates: CoordinatesModel?
}

struct CoordinatesModel: Decodable {
    let latitude: Double?
    let longitude: Double?
}

struct AddressModel: Decodable {
    let address: String?
    let full_address: String?
    let coordinates: CoordinatesModel?
}
