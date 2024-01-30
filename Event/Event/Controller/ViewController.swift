//
//  ViewController.swift
//  Event
//
//  Created by Atheer Al Zahrani on 29/06/1444 AH.
//

import UIKit


class ViewController: UIViewController {

    var cotrller: EventCotroller?
//    var events = [Event]()
    private var tableView: EventTableViewController = {
        let tv = EventTableViewController()
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        EventAPI.requestEvents { events, error in
//            self.events = events
            print(events)
        }
    }


    func setupTableView(){
        view.addSubview(tableView.view)
        
    }

}

