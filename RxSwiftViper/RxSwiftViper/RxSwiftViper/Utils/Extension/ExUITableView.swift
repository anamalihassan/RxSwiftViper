//
//  ExUITableView.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

extension UITableView{
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
}
