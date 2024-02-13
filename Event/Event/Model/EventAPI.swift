//
//  EventAPI.swift
//  Event
//
//  Created by Atheer Al Zahrani on 13/07/1445 AH.
//

import Foundation


class EventAPI {
//    static let eventAPI = EventAPI()
    
    enum Endpoint {
        case events
        case performers
        case venues
        
        
        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
            
            case .events:
                return "https://api.seatgeek.com/2" + "/events"
            case .performers:
                return "https://api.seatgeek.com/2" + "/performers"
            case .venues:
                return "https://api.seatgeek.com/2" + "/venues"
            }
        }
    
    }
    
    class func requestEvents(completion: @escaping (SeatGeekResponse?, Error?) -> Void){
        var request = URLRequest(url: Endpoint.events.url)
        request.httpMethod = "GET"
        let clientID = "Mzk2NjA5MjJ8MTcwNjUyMDA2Mi44MjQ4MDAz"
//        let clientSecret = "" // optionally
        let queryItems = [URLQueryItem(name: "client_id", value: clientID)]
        var components = URLComponents(url: Endpoint.events.url, resolvingAgainstBaseURL: true)!
        components.queryItems = queryItems
        request.url = components.url

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }

            if let data = data {
                do {
//
                    // Use JSONDecoder to parse the data
                    let decoder = JSONDecoder()
                    // Assuming you have an EventResponse array in your JSON
                    let seatGeekResponseObject = try decoder.decode(SeatGeekResponse.self, from: data)
                    // Handle the parsed data
                    completion(seatGeekResponseObject, nil)
                    

                                 
                } catch {
                    print("Error parsing JSON data: \(error)")
                }
            }
        }

        task.resume()
    }
   
}




/*
 case key = "c1c6df6bdbmsh18c3f9c2f67321ep12fdccjsn5e0f27e9420f"
 case host = "seatgeek-seatgeekcom.p.rapidapi.com"
 case endpoint = "https://api.seatgeek.com/2"
 */
