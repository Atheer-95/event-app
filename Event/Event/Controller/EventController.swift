//
//  EventController.swift
//  Event
//
//  Created by Atheer Al Zahrani on 13/07/1445 AH.
//

import UIKit

class EventController {
    
    var events = [Event]()
    
    func handleRequestEvent(tableView: UITableView){
        EventAPI.requestEvents { seatGeekResponse, error in
            // TODO: Loader
            guard let seatGeekResponse = seatGeekResponse else { return }
            self.events = seatGeekResponse.events
            DispatchQueue.main.async {
                tableView.reloadData()
            }
            
            for event in self.events {
                print(event.title)
            }
        }
    }
}
