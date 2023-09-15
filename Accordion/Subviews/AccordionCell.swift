//
//  AccordionCell.swift
//  Accordion
//
//  Created by Beatriz Herculano on 11/09/23.
//

import Foundation
import UIKit


class AccordionCell: UITableViewCell {
    public static var identifier: String = String(describing: AccordionCell.self)
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Temporario"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(text: String){
        label.text = text
    }
    
    func setupHierarchy(){
        contentView.addSubview(label)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
    
}
