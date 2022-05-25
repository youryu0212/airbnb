//
//  NewMapViewModel.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/25.
//

import Foundation
import MapKit
import RxRelay
import RxSwift

final class NewMapViewModel {
    let viewDidLoad = PublishRelay<Void>()
    
    let updateRegion = PublishRelay<MKCoordinateRegion>()
    let updatePin = PublishRelay<[CGPoint]>()
    
    private let disposeBag = DisposeBag()
    
    init() {
        viewDidLoad
            .map { _ -> MKCoordinateRegion in
                let center = CLLocationCoordinate2D(latitude: 37.4908205, longitude: 127.0334173)
                let span = MKCoordinateSpan(latitudeDelta: 0, longitudeDelta: 0.1)
                return MKCoordinateRegion(center: center, span: span)
            }
            .bind(to: updateRegion)
            .disposed(by: disposeBag)
        
        viewDidLoad
            .map { _ in
                [
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173),
                    CGPoint(x: 37.4908205, y: 127.0334173)
                ]
            }
            .bind(to: updatePin)
            .disposed(by: disposeBag)
        
    }
}
