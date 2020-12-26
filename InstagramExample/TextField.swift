//
//  TextField.swift
//  InstagramExample
//
//  Created by Nicolas Spinner on 21.12.20.
//

import UIKit

class TextField: UITextField {

    let padding = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

}
