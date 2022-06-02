//
//  Dummy.swift
//  airbnb
//
//  Created by Jihee hwang on 2022/05/31.
//

import Foundation

final class Dummy {
    
    var city: String
    var distance: String
    var image: String
    
    init(city: String, distance: String, image: String) {
        self.city = city
        self.distance = distance
        self.image = image
    }
    
    static var dataList = [Dummy(city: "서울", distance: "차로 30분 거리", image: "Seoul"),
                           Dummy(city: "광주", distance: "차로 4시간 거리", image: "Gwangju"),
                           Dummy(city: "의정부", distance: "차로 30분 거리", image: "Uijeongbu"),
                           Dummy(city: "수원", distance: "차로 45분 거리", image: "Suwon"),
                           Dummy(city: "대구", distance: "차로 3.5시간 거리", image: "Daegu"),
                           Dummy(city: "울산", distance: "차로 4.5시간 거리", image: "Ulsan"),
                           Dummy(city: "대전", distance: "차로 2시간 거리", image: "Daejeon"),
                           Dummy(city: "부천", distance: "차로 30분 거리", image: "Bucheon")]
}
