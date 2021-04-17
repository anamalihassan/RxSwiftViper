//
//  ExUITableViewCell.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

extension UITableViewCell {
    func animateCell() {
        self.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.3, animations: {
            self.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                self.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
    }
}
