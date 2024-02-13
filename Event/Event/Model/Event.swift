//
//  Event.swift
//  Event
//
//  Created by Atheer Al Zahrani on 29/06/1444 AH.
//

import Foundation

struct SeatGeekResponse: Decodable {
    let events: [Event]
    let meta: MetaData
}

struct MetaData: Decodable {
    let geolocation: String?
    let page: Int
    let perPage: Int
    let took: Int
    let total: Int

    private enum CodingKeys: String, CodingKey {
        case geolocation
        case page
        case perPage = "per_page"
        case took
        case total
    }
}

// ... Your existing Event, Stats, Performer, etc. structs ...
struct Event: Decodable {
    let stats: Stats
    let title: String //
    let url: String
    let datetimeLocal: String //
    let performers: [Performer]
    let venue: Venue
    let shortTitle: String //
    let datetimeUtc: String
    let score: Double
    let taxonomies: [Taxonomy]
    let type: String //
    let id: Int

    enum CodingKeys: String, CodingKey {
        case stats, title, url, performers, venue, score, taxonomies, type, id
        case datetimeLocal = "datetime_local"
        case shortTitle = "short_title"
        case datetimeUtc = "datetime_utc"
    }
}

struct Stats: Decodable {
    let listingCount: Int?
    let averagePrice: Int?
    let lowestPrice: Int?
    let highestPrice: Int?

    enum CodingKeys: String, CodingKey {
        case listingCount = "listing_count"
        case averagePrice = "average_price"
        case lowestPrice = "lowest_price"
        case highestPrice = "highest_price"
    }
}

struct Performer: Decodable {
    let name: String
    let shortName: String
    let url: String
    let image: String?
    let images: PerformerImages?
    let primary: Bool?
    let id: Int
    let score: Double
    let type: String
    let slug: String

    enum CodingKeys: String, CodingKey {
        case name, url, image, images, primary, id, score, type, slug
        case shortName = "short_name"
    }
}

struct PerformerImages: Decodable {
    let large: String?
    let huge: String?
    let small: String?
    let medium: String?
}

struct Venue: Decodable {
    let city: String
    let name: String
    let extendedAddress: String?
    let url: String
    let country: String
    let state: String
    let score: Double
    let postalCode: String
    let location: Location
    let address: String?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case city, name, url, country, state, score, location, address, id
        case extendedAddress = "extended_address"
        case postalCode = "postal_code"
    }
}

struct Location: Decodable {
    let lat: Double
    let lon: Double
}

struct Taxonomy: Decodable {
    let parentId: Int?
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case parentId = "parent_id"
    }
}
