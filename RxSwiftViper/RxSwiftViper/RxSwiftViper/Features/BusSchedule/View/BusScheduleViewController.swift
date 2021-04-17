//
//  BusScheduleViewController.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 09/04/2021.
//

import UIKit
import RxSwift

class BusScheduleViewController: AppViewController {
    
    let stationObject: StationObject
    
    var presentor: BusesScheduleViewToPresenterProtocol?
    var busScheduleSections: [BusScheduleSection] = []
    var isDeparture = true
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.layoutMargins = UIEdgeInsets.zero
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BusScheduleTableViewCell.self, forCellReuseIdentifier: BusScheduleTableViewCell.identifier)
        tableView.accessibilityIdentifier = "busScheduleTV"
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
    
    init(stationObject: StationObject) {
        self.stationObject = stationObject
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setConstraint()
        fetchPresenter()
    }
    
    private func setUpView(){
        let rightBarButtonItem = UIBarButtonItem.init(image: UIImage(systemName: Constants.Assets.ICON_DEPARTURE), style: .done, target: self, action: #selector(BusScheduleViewController.sortButtonTapped))

        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        dotIndicator = DotIndicatorView()
        view.addBackgroundColor(addColor: .white)
        view.addSubview(tableView)
        tableView.addSubview(refreshControl)
    }
    
    private func fetchPresenter() {
        presentor?.fetchingBusesSchedule(station_id: stationObject.id)
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
    
    @objc func sortButtonTapped(sender: UIBarButtonItem) {
        presentor?.toggleDeparture()
        isDeparture = !isDeparture
        let imageName = isDeparture ? Constants.Assets.ICON_DEPARTURE : Constants.Assets.ICON_ARRIVAL
        self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: imageName)
    }
}

extension BusScheduleViewController: BusesSchedulePresenterToViewProtocol {
    
    func showBusesSchedule(busesSchedule: [BusScheduleSection]?) {
        self.busScheduleSections = busesSchedule ?? []
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


