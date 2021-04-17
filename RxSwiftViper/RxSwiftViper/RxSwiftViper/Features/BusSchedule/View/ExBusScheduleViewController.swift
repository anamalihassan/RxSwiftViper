//
//  ExBusScheduleViewController.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit

// MARK: - Table View

extension BusScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderTitleTableViewCell(frame: .zero)
        headerView.titleLabel.text = busScheduleSections[section].date
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return busScheduleSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busScheduleSections[section].buses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BusScheduleTableViewCell.identifier, for: indexPath) as! BusScheduleTableViewCell
        cell.accessibilityIdentifier = "busScheduleCell_\(indexPath.section)\(indexPath.row)"
        cell.configureCell(busScheduleModel: busScheduleSections[indexPath.section].buses[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

