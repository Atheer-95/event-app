//
//  EventTableViewController.swift
//  Event
//
//  Created by Atheer Al Zahrani on 29/06/1444 AH.
//

import UIKit
import LBTATools

class EventTableViewController: UIViewController {

    var events: [Event]?
    var tableView: UITableView!
    var controller: EventController?
    
    convenience init(tableViewStyle: UITableView.Style = .grouped) {
        self.init()
        tableView = UITableView(frame: .zero, style: tableViewStyle)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .red
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        view.addSubview(tableView)
        tableView.fillSuperview()
        setupEventData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
//        setupEventData()
    }
    
    func setupEventData(){
        controller?.handleRequestEvent()
        self.events = controller?.events
    }
}


// MARK: - Table view delegate & data source

extension EventTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell
        
        if let event = events?[indexPath.row] {
            cell.setupCellData(event: event)
            return cell
        }
        return EmptyEventTableViewCell.init()
    }
    
    
}
