//
//  MapViewController.swift
//  AirbnbApp
//
//  Created by 박진섭 on 2022/05/24.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {
    
    private let mapView = MapView(frame: CGRect(origin: .zero, size: UIScreen.main.bounds.size))
    
    private let startCordinate = CLLocationCoordinate2D(latitude: 37.490765, longitude: 127.033433)
    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocationManager()
        setMapView()
    }
    
    private func setMapView() {
        self.view = mapView
        self.mapView.delegate = self
        
        self.mapView.setRegion(MKCoordinateRegion(center: startCordinate, span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)), animated: true)
    }
    
    private func setLocationManager() {
        self.locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
}

extension MapViewController: CLLocationManagerDelegate {
    
}

