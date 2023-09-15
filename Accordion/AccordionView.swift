//
//  AccordionView.swift
//  Accordion
//
//  Created by Beatriz Herculano on 07/09/23.
//

import Foundation
import UIKit

class AccordionView: UIView{
    
    var accordionsData:[AccordionData] = []
    
    private lazy var scroll:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
//        scroll.isDirectionalLockEnabled = true
        return scroll
    }()
    
    private lazy var tableView: ContentSizeTableView = {
        let table = ContentSizeTableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isScrollEnabled = false
        table.delegate = self
        table.dataSource = self
        table.isDirectionalLockEnabled = true
        table.register(AccordionCell.self, forCellReuseIdentifier: AccordionCell.identifier)
        return table
    }()
    
    
    init(){
        super.init(frame: .zero)
        backgroundColor = .white
        setupHierarchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(accordionData: [AccordionData]){
        self.accordionsData = accordionData
        tableView.reloadData()
    }
    
    
    func setupHierarchy(){
        addSubview(scroll)
        scroll.addSubview(tableView)
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: topAnchor),
            scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            scroll.bottomAnchor.constraint(equalTo: bottomAnchor),
            scroll.widthAnchor.constraint(equalTo: widthAnchor),
            
            tableView.topAnchor.constraint(equalTo: scroll.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 20),
            tableView.widthAnchor.constraint(equalTo: scroll.widthAnchor, constant: -40)
        ])
    }
    
    private func buildIndexPath(section: Int)-> [IndexPath]{
        var indexes: [IndexPath] = []
        for (index, _) in accordionsData[section].rows.enumerated(){
            indexes.append(IndexPath(row: index, section: section))
        }
        return indexes
    }
}

extension AccordionView: AccordionHeaderDelegate{
    func headerTapped(index: Int) {
        let indexes = buildIndexPath(section: index)
        if accordionsData[index].isExpanded {
            accordionsData[index].isExpanded.toggle()
            tableView.deleteRows(at: indexes, with: .automatic)
        } else {
            accordionsData[index].isExpanded.toggle()
            tableView.insertRows(at: indexes, with: .automatic)
        }
    }
}

extension AccordionView: UITableViewDelegate{
    
}

extension AccordionView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return accordionsData.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = AccordionHeader(index: section)
        header.configure(title: accordionsData[section].title)
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accordionsData[section].isExpanded ? accordionsData[section].rows.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccordionCell.identifier) as! AccordionCell? else {
            return UITableViewCell()
        }
        cell.configure(text: accordionsData[indexPath.section].rows[indexPath.row])
        return cell
    }

}
