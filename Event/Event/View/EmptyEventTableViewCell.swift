//
//  EmptyEventTableViewCell.swift
//  Event
//
//  Created by Atheer Othman on 27/07/1445 AH.
//

import UIKit

class EmptyEventTableViewCell: UITableViewCell {
    
    lazy var emptyEventLabel: UILabel = {
        let l = UILabel()
        l.text = "No Events For Now ): , try again later"
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellConstriant()
    }
    
    func setupCellConstriant(){
        addSubview(emptyEventLabel)
        NSLayoutConstraint.activate([
            emptyEventLabel.topAnchor.constraint(equalTo: topAnchor),
            emptyEventLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            emptyEventLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyEventLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
