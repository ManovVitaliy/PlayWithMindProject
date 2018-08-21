//
//  CollapsibleTableViewHeader.swift
//  PlayWithMind
//
//  Created by user on 5/23/18.
//  Copyright © 2018 Vitaliy. All rights reserved.
//

import UIKit

class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    
    //MARK: - properties and delegates
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    //MARK: - outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    
    //MARK: - initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader(gestureRecognizer:))))
    }
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        delegate?.toggleSection(header: self, section: cell.section)
    }
    func setCollapsed(collapsed: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.arrowLabel.rotate(collapsed ? 0.0 : .pi / 2)
        }
    }
}

extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        self.layer.add(animation, forKey: nil)
    }
}
