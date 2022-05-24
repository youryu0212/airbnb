//
//  MapViewController.swift
//  AirbnbApp
//
//  Created by 박진섭 on 2022/05/24.
//

import Foundation
import MapKit

final class MapViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = MKMapView(frame:self.view.frame)
    }
}
