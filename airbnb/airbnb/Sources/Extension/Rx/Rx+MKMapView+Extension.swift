//
//  MKMapView+Extension.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import MapKit
import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base: MKMapView {

    var delegate: DelegateProxy<MKMapView, MKMapViewDelegate> {
        RxMKMapViewDelegateProxy.proxy(for: self.base)
    }

    var regionDidChangeAnimated: Observable<Bool> {
        delegate.methodInvoked(#selector(MKMapViewDelegate.mapView(_:regionDidChangeAnimated:)))
            .map({ parameters in
                parameters[1] as? Bool ?? false
            })
    }
}

class RxMKMapViewDelegateProxy: DelegateProxy<MKMapView, MKMapViewDelegate>, DelegateProxyType, MKMapViewDelegate {

    static func registerKnownImplementations() {
        self.register { mapView -> RxMKMapViewDelegateProxy in
            RxMKMapViewDelegateProxy(parentObject: mapView, delegateProxy: self)
        }
    }

    static func currentDelegate(for object: MKMapView) -> MKMapViewDelegate? {
        object.delegate
    }

    static func setCurrentDelegate(_ delegate: MKMapViewDelegate?, to object: MKMapView) {
        object.delegate = delegate
    }
}
