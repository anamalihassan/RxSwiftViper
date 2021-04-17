//
//  StationsViewController.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit
import SnapKit
import RxSwift

class StationsViewController: AppViewController {
    var presentor: StationsViewToPresenterProtocol?
    var stations: [StationObject] = []
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StationTableViewCell.self, forCellReuseIdentifier: StationTableViewCell.identifier)
        tableView.accessibilityIdentifier = "stationsTV"
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(handleRefresh(_:)),
                                 for: .valueChanged)
        refreshControl.tintColor = AppColor.appPrimary.color
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dotIndicator = DotIndicatorView()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
        setConstraint()
        fetchPresenter()
    }
    
    private func fetchPresenter() {
       presentor?.fetchingStations()
    }
    
    
    private func setConstraint() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        fetchPresenter()
    }
}

extension StationsViewController: StationsPresenterToViewProtocol {
    
    func showBusStations(stations: [StationObject]?) {
        self.stations = stations ?? []
        self.tableView.reloadData()
    }
    
    
    func showError(error: String) {
        snackbar.message = error
        snackbar.messageTextColor = AppColor.red.color
        snackbar.backgroundColor = AppColor.white.color
        snackbar.show()
    }
    
    func isLoading(isLoading: Bool) {
        isLoading ? dotIndicator?.startAnimating() : dotIndicator?.stopAnimating()
        if isLoading {
            self.refreshControl.endRefreshing()
        }
    }
}


