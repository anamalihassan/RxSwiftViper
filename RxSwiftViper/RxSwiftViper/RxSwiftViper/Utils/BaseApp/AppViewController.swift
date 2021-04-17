//
//  AppViewController.swift
//  RxSwiftViper
//
//  Created by Ali Hassan on 07/03/2021.
//

import UIKit

class AppViewController: UIViewController {
    
    let snackbar = Snackbar(message: "",
                               duration: .middle,
                               actionText: Constants.App.CLOSE_MSG,
                               actionBlock: { (snackbar) in
                                snackbar.dismiss()
    })
    
    var dotIndicator: DotIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
