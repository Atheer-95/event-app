//
//  EventController.swift
//  Event
//
//  Created by Atheer Al Zahrani on 13/07/1445 AH.
//

import Foundation

class EventController {
    
    var events = [Event]()
    
    func handleRequestEvent(){
        EventAPI.requestEvents { seatGeekResponse, error in
            guard let seatGeekResponse = seatGeekResponse else { return }
            self.events = seatGeekResponse.events
            for event in self.events {
                print(event.title)
            }
//                print(self.events)
        }
    }
}
