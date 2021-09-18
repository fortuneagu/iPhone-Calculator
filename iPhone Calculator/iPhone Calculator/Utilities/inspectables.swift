//
//  inspectables.swift
//  iPhone Calculator
//
//  Created by Decagon on 19/07/2021.
//

import UIKit

@IBDesignable class RoundedView: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
