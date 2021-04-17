//
//  BaseTableViewCell.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

class AppTableViewCell: UITableViewCell {
    
    open class var identifier: String { return String.className(self) }
    
    // MARK: - View Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareView()
        setConstraintsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    func prepareView() {
        
    }
    
    func setConstraintsView() {
        
    }
}
