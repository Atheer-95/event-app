//
//  Composer.swift
//  Event
//
//  Created by Atheer Othman on 25/07/1445 AH.
//

import Foundation

class Composer {
    
    class func tabBarController() -> TabBar {
        let tabBar = TabBar()
        return tabBar
    }
    
    class func eventViewController(controller: EventController = EventController()) -> EventViewController{
        let vc = EventViewController()
        vc.controller = controller
        return vc
    }
    
    class func eventTableViewController() -> EventTableViewController {
        let tvc = EventTableViewController(tableViewStyle: .grouped)
        tvc.controller = EventController()
        return tvc
    }
}
