//
//  ViewController.swift
//  Accordion
//
//  Created by Beatriz Herculano on 07/09/23.
//

import UIKit

class ViewController: UIViewController {
    var contentView: AccordionView?
    var accordions: [AccordionData] = [
        .init(title: "These are my cats", rows: [
        "Misty", "Boo", "Mike","Sullivan","Tempestade", "Falcon", "Nemo", "Dori", "Zelda"
        ]),
        .init(title: "These are my mothers cats", rows: [
            "Duke", "Mavis"
        ])
    ]
    
    init(){
        super.init(nibName: nil, bundle: nil)
        contentView = AccordionView()
        view = contentView
        contentView?.configure(accordionData: accordions)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

