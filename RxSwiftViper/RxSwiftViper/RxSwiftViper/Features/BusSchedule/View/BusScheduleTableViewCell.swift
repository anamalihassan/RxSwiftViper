//
//  BusScheduleTableViewCell.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 08/04/2021.
//

import UIKit

class BusScheduleTableViewCell: AppTableViewCell {
    
    // MARK: - Properties
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.bold.customFont, size: AppFonts.Size.title)
        label.textColor = AppColor.textGray.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.bold.customFont, size: AppFonts.Size.title)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textColor = AppColor.textGray.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let routeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.regular.customFont, size: AppFonts.Size.body)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = AppColor.textLightGray.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - UI Setup
    
    override func prepareView() {
        self.contentView.addSubview(timeLabel)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(routeLabel)
        
        backgroundColor = UIColor.clear
        selectionStyle = .none
        accessibilityIdentifier = "stationTableViewCell"
    }
    
    override func setConstraintsView() {
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.width.equalTo(45)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalTo(timeLabel.snp.right).offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        routeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }

}

extension BusScheduleTableViewCell {
    
    func configureCell(busScheduleModel: BusScheduleModel?) {
        if let data = busScheduleModel {
            self.timeLabel.text = data.datetime?.timeString ?? "12:00"
            self.titleLabel.text = data.line_direction
            self.routeLabel.text = data.through_the_stations
        }
    }
}
