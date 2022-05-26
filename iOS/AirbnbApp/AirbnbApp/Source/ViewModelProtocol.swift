//
//  ViewModelProtocol.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/26.
//

import Foundation

protocol ViewModelProtocol {
    associatedtype Action
    associatedtype State
    
    var action: Action { get }
    var state: State { get }
}
