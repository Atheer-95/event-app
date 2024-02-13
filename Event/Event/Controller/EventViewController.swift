//
//  ViewController.swift
//  Event
//
//  Created by Atheer Al Zahrani on 29/06/1444 AH.
//

import UIKit
import LBTATools

class EventViewController: UIViewController {

    var controller: EventController?
    
    let EventTableViewCellIdentifier = "EventTableViewCell"
    let EmptyEventTableViewCellIdentifier = "EmptyEventTableViewCell"
    
    private var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .insetGrouped)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCellIdentifier)
        tableView.register(EmptyEventTableViewCell.self, forCellReuseIdentifier: EmptyEventTableViewCellIdentifier)
//        controller?.handleRequestEvent()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        controller?.handleRequestEvent()
        tableView.reloadData()
    }

    func setupTableView(){
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.safeAreaLayoutGuide.bottomAnchor,
                         trailing: view.trailingAnchor)

    }

}

// MARK: - Table Data Source & Delegate

extension EventViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.events.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: EventTableViewCellIdentifier, for: indexPath) as! EventTableViewCell
        if let event = controller?.events[indexPath.row] {
            cell.setupCellData(event: event)
            return cell
        }
        let emptyCell = tableView.dequeueReusableCell(withIdentifier: EmptyEventTableViewCellIdentifier, for: indexPath) as! EmptyEventTableViewCell
        return emptyCell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    
//        return 100
//    }

    
}


var fakeEventData = ["one", "tow", "three", "four"]
