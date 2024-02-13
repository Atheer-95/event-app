//
//  EmptyEventTableViewCell.swift
//  Event
//
//  Created by Atheer Othman on 27/07/1445 AH.
//

import UIKit

class EmptyEventTableViewCell: UITableViewCell {
    
    var emptyEventLabel: UILabel = {
        let l = UILabel()
        l.text = "No Events For Now ): \n try again later."
        l.numberOfLines = 0
        l.textColor = .systemGray2
        l.textAlignment = .center
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellConstriant()
        selectionStyle = .none
    }
    
    func setupCellConstriant(){
        addSubview(emptyEventLabel)
        emptyEventLabel.anchor(top: topAnchor,
                               leading: leadingAnchor,
                               bottom: bottomAnchor,
                               trailing: trailingAnchor,
                               padding: UIEdgeInsets(top: 100,
                                                     left: 0,
                                                     bottom: 50,
                                                     right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
