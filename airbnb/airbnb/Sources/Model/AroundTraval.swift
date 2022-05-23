//
//  AroundTraval.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import Foundation

struct AroundTravals: Decodable {
    let list: [AroundTraval]
}

struct AroundTraval: Decodable {
    let imageUrl: URL
    let name: String
    let distance: String
}
