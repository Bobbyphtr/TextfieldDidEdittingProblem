//
//  UITextFieldExtension.swift
//  TextfieldDidEdittingProblem
//
//  Created by BobbyPhtr on 28/04/21.
//

import Foundation

import UIKit

protocol Keyboarded {
    var addDoneButton : Bool {set get}
}

extension UITextField : Keyboarded {
    @IBInspectable var addDoneButton: Bool {
        get {
            return addDoneButtonOnKeyboard()
        }
        set {
            if newValue {
                _ = addDoneButtonOnKeyboard()
            }
        }
    }
    
    
    func addDoneButtonOnKeyboard()->Bool{
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        done.setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .normal)
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
        return true
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
