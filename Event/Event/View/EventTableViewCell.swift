//
//  EventTableViewCell.swift
//  Event
//
//  Created by Atheer Al Zahrani on 29/06/1444 AH.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    lazy var eventTitleLabel: UILabel = {
        let l  = UILabel()
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellConstriant()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellData(event: Event?){
        eventTitleLabel.text = event?.title
    }

    func cellTest(data: String){
        eventTitleLabel.text = data
    }
    private func setupCellConstriant(){
        addSubview(eventTitleLabel)
        eventTitleLabel.anchor(top: topAnchor,
                               leading: leadingAnchor,
                               bottom: nil,
                               trailing: nil)
//        NSLayoutConstraint.activate([
//            eventTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            eventTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10)
//        ])
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
