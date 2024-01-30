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
    let title: String
    let url: String
    let datetimeLocal: String
    let performers: [Performer]
    let venue: Venue
    let shortTitle: String
    let datetimeUtc: String
    let score: Double
    let taxonomies: [Taxonomy]
    let type: String
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

//
//struct Event: Decodable {
//    let stats: Stats
//    let title: String
//    let url: String
//    let datetimeLocal: String
//    let performers: [Performer]
//    let venue: Venue
//    let shortTitle: String
//    let datetimeUTC: String
//    let score: Double
//    let taxonomies: [Taxonomy]
//    let type: String
//    let id: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case stats, title, url, performers, venue, score, taxonomies, type, id
//        case datetimeLocal = "datetime_local"
//        case shortTitle = "short_title"
//        case datetimeUTC = "datetime_utc"
//    }
//}
//
//
//struct Stats: Decodable{
//    var listingCount: Int
//    var averagePrice: Int
//    var lowestPrice: Int
//    var highestPrice: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case listingCount = "listing_count"
//        case averagePrice = "average_price"
//        case lowestPrice = "lowest_price"
//        case highestPrice = "highest_price"
//    }
//}
//
//
//struct Performer: Decodable {
//    var name: String
//    var shortName: String
//    var url: String
//    var image: String?
//    var images: PerformerImages?
//    var primary: Bool?
//    var id: Int
//    var score: Double
//    var type: String
//    var slug: String
//
//    private enum CodingKeys: String, CodingKey {
//        case name, url, image, images, primary, id, score, type, slug
//        case shortName = "short_name"
//    }
//}
//
//struct PerformerImages: Decodable {
//    var large: String?
//    var huge: String?
//    var small: String?
//    var medium: String?
//
//    private enum CodingKeys: String, CodingKey {
//        case large, huge, small, medium
//    }
//}
//
//
//struct Venue: Decodable {
//    var city: String
//    var name: String
//    var extendedAddress : String?
//    var url: String
//    var country: String
//    var state: String
//    var score: Double
//    var postalCode: String
//    var location: Location
//    var address: String?
//    var id: Int
//
//    private enum CodingKeys: String, CodingKey {
//        case name, city, url, country, state, score, location, address, id
//        case extendedAddress = "extended_address"
//        case postalCode = "postal_code"
//    }
//}
//
//struct Location: Decodable {
//    var lat: Double
//    var lon: Double
//
//}
//
//struct Taxonomy: Decodable {
//    var parentId: Int?
//    var id: Int
//    var name: String
//
//    private enum CodingKeys: String, CodingKey {
//        case id, name
//        case parentId = "parent_id"
//    }
//}


/*
 Example Response Document
 {
     "stats": {
         "listing_count": 161,
         "average_price": 97,
         "lowest_price": 62,
         "highest_price": 296
     },
     "title": "Young The Giant with Grouplove",
     "url": "https://seatgeek.com/young-the-giant-with-grouplove-tickets/new-york-new-york-terminal-5-2012-03-09/concert/721901/",
     "datetime_local": "2012-03-09T19:00:00",
     "performers": [
         {
             "name": "Young The Giant",
             "short_name": "Young The Giant",
             "url": "https://seatgeek.com/young-the-giant-tickets/",
             "image": "https://chairnerd.global.ssl.fastly.net/images/bandshuge/band_8741.jpg",
             "images": {
                 "large": "https://chairnerd.global.ssl.fastly.net/images/performers/8741/eec61caec82950448b257c5e539147bc/large.jpg",
                 "huge": "https://chairnerd.global.ssl.fastly.net/images/performers/8741/555bce1815140ad65ab0b1066467ae7d/huge.jpg",
                 "small": "https://chairnerd.global.ssl.fastly.net/images/performers/8741/af7a8925e50bb74315337a9450206a39/small.jpg",
                 "medium": "https://chairnerd.global.ssl.fastly.net/images/performers/8741/686f925886504610936135abd240235c/medium.jpg"
             },
             "primary": true,
             "id": 8741,
             "score": 6404,
             "type": "band",
             "slug": "young-the-giant"
         },
         {
             "name": "Grouplove",
             "short_name": "Grouplove",
             "url": "https://seatgeek.com/grouplove-tickets/",
             "image": null,
             "images": null,
             "id": 8987,
             "score": 4486,
             "type": "band",
             "slug": "grouplove"
         }
     ],
     "venue": {
         "city": "New York",
         "name": "Terminal 5",
         "extended_address": null,
         "url": "https://seatgeek.com/terminal-5-tickets/",
         "country": "US",
         "state": "NY",
         "score": 149.259,
         "postal_code": "10019",
         "location": {
             "lat": 40.77167,
             "lon": -73.99277
         },
         "address": null,
         "id": 814
     },
     "short_title": "Young The Giant with Grouplove",
     "datetime_utc": "2012-03-10T00:00:00",
     "score": 116.977,
     "taxonomies": [
         {
             "parent_id": null,
             "id": 2000000,
             "name": "concert"
         }
     ],
     "type": "concert",
     "id": 721901
 }
 }
 */
