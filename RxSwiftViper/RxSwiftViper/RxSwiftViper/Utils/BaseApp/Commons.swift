//
//  Commons.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 06/03/2021.
//

import UIKit

@objc class Commons: NSObject {
    static func label(id: String, type: AppFonts, text: String, size: CGFloat, addColor: AppColor = .black, align: NSTextAlignment) -> UILabel {
        let label = UILabel(frame: .zero)
        label.textColor = addColor.color
        label.accessibilityIdentifier = "label_identifier_\(id)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = align
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: type.customFont, size: size)
        label.text = text
        return label
    }
    
    static func image(id: String, image: UIImage) -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = "image_identifier_\(id)"
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    static func view(addColor: AppColor) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = addColor.color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    @objc(getSnackbar)
    static func getSnackbar() -> Snackbar {
        let snackbar = Snackbar(message: "",
                                   duration: .middle,
                                   actionText: Constants.App.CLOSE_MSG,
                                   actionBlock: { (snackbar) in
                                    snackbar.dismiss()
        })
        snackbar.messageTextColor = AppColor.red.color
        snackbar.backgroundColor = AppColor.white.color
        return snackbar
    }
}
