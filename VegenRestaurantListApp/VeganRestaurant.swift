//
//  VeganRestaurant.swift
//  VegenRestaurantListApp
//
//  Created by Shun-Ching, Chou on 2019/4/15.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import Foundation

struct VeganRestaurant: Codable {
    var meta: Meta
    var response: Response
}

struct Meta: Codable {
    var code: Int
    var requestId: String
}

struct Response: Codable {
    var venues: [Venue]
    var confident: Bool
    var geocode: Geocode
}

struct Venue: Codable {
    var id: String
    var name: String
    var location: Location
    var categories: [Categories]
    var referralId: String
    var hasPerk: Bool
}

struct Geocode: Codable {
    var what: String
    //        var where: String
    var feature: Feature
    //        var parents: [Any]
}

struct Feature: Codable {
    var cc: String
    var name: String
    var displayName: String
    var matchedName: String
    var highlightedName: String
    var woeType: Int
    var slug: String
    var id: String
    var longId: String
    var geometry: Geometry
}

struct Geometry: Codable {
    var center: Center
    var bounds: Bounds
}

struct Center: Codable {
    var lat: Double
    var lng: Double
}

struct Bounds: Codable {
    var ne: Center
    var sw: Center
}

struct Location: Codable {
    var address: String?
    var crossStreet: String?
    var lat: Double
    var lng: Double
    var labeledLatLngs: [LabeledLatLngs]
    var postalCode: String?
    var cc: String?
    var neighborhood: String?
    var city: String?
    var state: String?
    var country: String?
    var formattedAddress: [String]
}

struct Categories: Codable {
    var id: String
    var name: String
    var pluralName: String
    var shortName: String
    var icon: Icon
    var primary: Bool
}

struct VenuePage: Codable {
    var id: String
}

struct Icon: Codable {
    var prefix: URL
    var suffix: String
}

struct LabeledLatLngs: Codable {
    var label: String
    var lat: Double
    var lng: Double
}
