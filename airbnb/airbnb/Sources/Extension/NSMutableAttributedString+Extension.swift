//
//  NSMutableAttributedString+Extension.swift
//  airbnb
//
//  Created by seongha shin on 2022/05/23.
//

import Foundation

extension NSMutableAttributedString {
    
    func addStrings(_ strings: [NSAttributedString]) -> NSMutableAttributedString {
        strings.forEach {
            self.append($0)
        }
        return self
    }
}
