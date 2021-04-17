//
//  HeaderTitleTableViewCell.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

class HeaderTitleTableViewCell : UIView {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppFonts.regular.customFont, size: AppFonts.Size.subHeader)
        label.textColor = AppColor.white.color
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    let mapIcon:UIImageView = {
//        let icon = Commons.image(id: Constants.Assets.MAP_ICON, image: #imageLiteral(resourceName: "mapIcon"))
//        icon.isUserInteractionEnabled = true
//        icon.isHidden = true
//        return icon
//    }()

    let headerContainer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = AppColor.appPrimaryDarker.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(headerContainer)
        
        headerContainer.addSubview(titleLabel)
        
        headerContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
