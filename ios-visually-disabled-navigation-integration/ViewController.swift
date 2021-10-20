//
//  ViewController.swift
//  ios-visually-disabled-navigation-integration
//
//  Created by Emre Kuru on 20.10.2021.
//

import UIKit
import PoilabsVdNavigationUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let lang = Locale.current.languageCode ?? "tr"
        let appId = "APPLICATION_ID"
        let secret = "APPLICATION_SECRET_KEY"
        let uniqueIdentifier = "UNIQUE_ID"

        PoilabsVdNavigationUI(withApplicationID: appId,
                            withApplicationSecret: secret,
                            withUniqueIdentifier: uniqueIdentifier,
                            lang: lang) { (controller) in
                    //show controller
                }
    }


}

