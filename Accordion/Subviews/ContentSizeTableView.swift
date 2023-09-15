//
//  ContentSizeTableView.swift
//  Accordion
//
//  Created by Beatriz Herculano on 11/09/23.
//

import Foundation
import UIKit

final class ContentSizeTableView: UITableView {
    override var contentSize: CGSize {
        didSet{
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutSubviews()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
