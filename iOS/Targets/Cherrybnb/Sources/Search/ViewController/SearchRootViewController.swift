//
//  SearchViewController.swift
//  Cherrybnb
//
//  Created by 최예주 on 2022/05/24.
//  Copyright © 2022 Codesquad. All rights reserved.
//

import UIKit
import CoreLocation

class SearchRootViewController: UIViewController {

    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        askPermission()
    }

    private func configureNavBar() {
        navigationController?.navigationBar.isHidden = true
    }

    private func askPermission() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
}

extension SearchRootViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // TODO: Handling updated location
    }
}
