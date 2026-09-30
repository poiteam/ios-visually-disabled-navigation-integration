//
//  ViewController.swift
//  ios-visually-disabled-navigation-integration
//
//  Created by Emre Kuru on 20.10.2021.
//

import UIKit
import PoilabsVdNavigationUI

class ViewController: UIViewController {

    // SDK nesnesi SDK ekranı açık kaldığı sürece tutulmalı.
    private var poilabsVdNavigation: PoilabsVdNavigationUI?

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard poilabsVdNavigation == nil else { return }

        let appId = "APPLICATION_ID"
        let secret = "APPLICATION_SECRET_KEY"
        let uniqueIdentifier = "UNIQUE_ID"

        poilabsVdNavigation = PoilabsVdNavigationUI(withApplicationID: appId,
                                                    withApplicationSecret: secret,
                                                    withUniqueIdentifier: uniqueIdentifier) { [weak self] controller in
            DispatchQueue.main.async {
                controller.modalPresentationStyle = .fullScreen
                self?.present(controller, animated: true)
            }
        }
    }
}
