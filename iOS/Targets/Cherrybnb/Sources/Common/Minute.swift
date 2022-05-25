//
//  Minute.swift
//  Cherrybnb
//
//  Created by Bumgeun Song on 2022/05/25.
//  Copyright © 2022 Codesquad. All rights reserved.
//

import Foundation

struct Minute {
    let value: Float
    
    init(_ value: Float) {
        self.value = value
    }
    
    var toSeconds: Float {
        value * 60
    }
}
