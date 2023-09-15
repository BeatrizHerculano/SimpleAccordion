//
//  AccordionHeader.swift
//  Accordion
//
//  Created by Beatriz Herculano on 11/09/23.
//

import Foundation
import UIKit


protocol AccordionHeaderDelegate: AnyObject{
    func headerTapped(index: Int)
}

final class AccordionHeader: UIView{
    var index: Int = -1
    
    weak var delegate: AccordionHeaderDelegate?
    var isExpanded = false
    
    lazy var row: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .equalCentering
        return stack
    }()
    
    lazy var header: UILabel = {
        let header = UILabel()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.font = .preferredFont(forTextStyle: .headline)
        header.text = "Header Temporario"
        return header
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.up"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(index: Int){
        self.index = index
        super.init(frame: .zero)
        backgroundColor = .white
        setupHierarchy()
        setupConstraints()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String){
        header.text = title
    }
    
    func setupGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        addGestureRecognizer(gesture)
    }
    
    @objc func didTap(){
        delegate?.headerTapped(index: index)
        
        if isExpanded {
            isExpanded.toggle()
            icon.image = UIImage(systemName: "chevron.up")
        } else {
            isExpanded.toggle()
            icon.image = UIImage(systemName: "chevron.down")
        }
    }
    
    
    func setupHierarchy(){
        addSubview(row)
        row.addArrangedSubview(header)
        row.addArrangedSubview(icon)
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            row.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            row.leadingAnchor.constraint(equalTo: leadingAnchor),
            row.trailingAnchor.constraint(equalTo: trailingAnchor),
            row.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -20)
        ])
    }
}
