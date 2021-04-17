//
//  StationTableViewCell.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

class StationTableViewCell: AppTableViewCell {
    
    // MARK: - Properties
    
    let stationTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.regular.customFont, size: AppFonts.Size.header)
        label.textColor = AppColor.textGray.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightIcon:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Assets.ICON_RIGHT)
        imageView.tintColor = AppColor.textGray.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - UI Setup
    
    override func prepareView() {
        self.contentView.addSubview(stationTitle)
        self.contentView.addSubview(rightIcon)
        
        backgroundColor = UIColor.clear
        selectionStyle = .none
        accessibilityIdentifier = "stationTableViewCell"
    }
    
    override func setConstraintsView() {
        stationTitle.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        rightIcon.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.width.equalTo(25)
            make.height.equalTo(60)
        }
    }

}

extension StationTableViewCell {
    
    func configureCell(data: StationObject?) {
        self.stationTitle.text = data?.name
    }
}
