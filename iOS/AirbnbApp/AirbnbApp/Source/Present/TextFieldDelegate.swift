//
//  TextFieldDelegate.swift
//  AirbnbApp
//
//  Created by 김상혁 on 2022/05/23.
//

import UIKit

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
